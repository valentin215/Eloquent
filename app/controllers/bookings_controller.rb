class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @course = Course.find(params[:course_id])
    @user = User.find(@course.user_id)
    # @payment = Payment.new
  end

  def create
    @user = current_user
    @course = Course.find(params[:course_id])
    @booking = Booking.new(total_price: @course.price, state: 'pending', user: current_user)
    @booking.course = @course
    @booking.user = current_user
    # @booking.total_price = @booking.course.price.to_i * @course.bookings.count
    @booking.save
  end

  def show
    @booking = current_user.bookings.where(state: 'paid').find(params[:id])
    @course = @booking.course

  end


#----------> Params empty we don't need a permission for bookings controller
  # private

  # def booking_params
  #   params.require(:booking).permit(:total_price)
  # end
end
