class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  def index
    @bookings = policy_scope(Booking).all
  end

  def show
    authorize @booking
    @booking = Booking.find(params[:id])
    @boat = @booking.boat
  end

  # def my_bookings
  #   @user = User.find(params[:id])
  #   @bookings = @user.bookings
  #   @boats = policy_scope(Booking).all
  # end

  # /boats/:boat_id/bookings
  def new
    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
    authorize @booking
  end

  # /boats/:boat_id/bookings
  def create
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    @booking.user = current_user

    authorize @booking

    if @booking.save
      BookingNotificationMailer.booking_notification(@booking).deliver_now
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
  def booking_params
    params.require(:booking).permit(:content, :start_date, :end_date)
  end

end
