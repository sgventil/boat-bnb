class BoatsController < ApplicationController
  # will need to add authentication for all except :index. :show
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_boat, only: %i[ show edit update destroy ]
  def index
    @boats = policy_scope(Boat).all
    @locations = Boat.pluck(:location).uniq
    @boats = apply_search_filters(@boats, params)

    return unless params[:location].present?

    @boats = @boats.where("location ILIKE ?", "%#{params[:location]}%")
  end

  def show
    authorize @boat
  end

  def my_boats
    @user = User.find(params[:id])
    @boats = @user.boats
    authorize @boats
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    authorize @boat
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def edit
    authorize @boat
  end

  def update
    authorize @boat
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    authorize @boat
    @boat.user = current_user
    @boat.destroy

    redirect_to my_boats_user_path(@boat.user)
  end

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :price, :description, :location, :photo)
  end

  def apply_search_filters(boats, params)
    boats = boats.search_by_city(params[:search]) if params[:search].present?
    boats = boats.where(location: params[:location].capitalize) if params[:location].present?
    boats = boats.where(availability: true) if params[:availability].present?
    boats
  end
end
