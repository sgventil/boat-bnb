class BoatsController < ApplicationController
  # will need to add authentication for all except :index. :show

  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      redirect_to boats_path(@boat)
    else
      render :new
    end
  end

  def edit
    @boat = Boat.find(paams[:id])
  end

  def update
    @boat = Boat.find(paams[:id])
    @boat.update(boat_params)
  end

  def destroy
    @boat = Boat.find(params[:id])
    @list.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :price, :description, :location)
  end
end
