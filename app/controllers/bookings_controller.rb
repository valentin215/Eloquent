class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @course = Course.find(params[:course_id])
  end

  def create
    @user = current_user
    @course = Course.find(params[:course_id])
    @booking = Booking.new
    @booking.course = @course
    @booking.user = current_user
    # @booking.total_price = @booking.course.price.to_i * @course.bookings.count
      if @booking.save
        redirect_to courses_index_path
      else
        render :new
      end
  end

#----------> Params empty we don't need a permission for bookings controller
  # private

  # def booking_params
  #   params.require(:booking).permit(:total_price)
  # end
end
