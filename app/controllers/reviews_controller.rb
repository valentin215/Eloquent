class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    # We need to write @booking too here because we will need it in the render new page
    # Otherwise it will throw an error
    @review.booking = @booking
    if @review.save
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end
end
