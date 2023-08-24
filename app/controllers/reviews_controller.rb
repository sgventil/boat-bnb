class ReviewsController < ApplicationController
  def new
    @review = Review.new(review_params)
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to boats_path(@boat)
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
