class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show destroy confirmation ]
  def index
    @bookings = policy_scope(Review).where(boat: boat)
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user = current_user
    @review.boat = @review.booking.boat

    authorize @review

    if @review.save
      redirect_to boats_path(@review.boat)
    else
      render :new
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end


end
