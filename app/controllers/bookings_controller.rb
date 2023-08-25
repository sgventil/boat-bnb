class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @booking = Booking.find(params[:user_id])
    @booking.boat = @boat
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @user = current_user
    @boat = Boat.find(params[:boat_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    @booking.user = current_user

    if @booking.save
      redirect_to user_bookings_path(@booking.user)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def booking_params
    params.require(:booking).permit(:content, :start_date, :end_date)
  end



end
