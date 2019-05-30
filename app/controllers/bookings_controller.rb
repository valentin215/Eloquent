class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @course = Course.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.course = @course
    @booking.user = current_user
    # @booking.total_price = @booking.course.price.to_i * @course.bookings.count
      if @booking.save
        redirect_to booking_path
      else
        render :new
      end
  end

  private

  def booking_params
    params.require(:booking).permit(:total_price, :user_id, :course_id)
  end
end
