class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @course = Course.find(params[:course_id])
  end

  def create
    @user = current_user
    @course = Course.find(params[:course_id])
    @booking = Booking.new(price_cents: @course.price, state: 'pending', user: current_user)
    @booking.course = @course
    @booking.user = current_user
    # @booking.total_price = @booking.course.price.to_i * @course.bookings.count
      if @booking.save
        redirect_to user_path(@user)
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
