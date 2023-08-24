class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    @booking.user = current_user
    @booking.save
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:content, :booking_date)
  end

end
