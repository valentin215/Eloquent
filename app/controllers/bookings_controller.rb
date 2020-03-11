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
    if @booking.save
      flash[:success] = "You booking has been sent !"
      redirect_to bookings_thanks_page_booking_path(course_id: @course.id)
      #sent email here
    else
      flash[:error] = "Something went wrong, please, try again !"
      render :new
    end 
  end

  # def show
  #   @booking = current_user.bookings.where(state: 'paid').find(params[:id])
  #   @course = @booking.course

  # end

  def thanks_page_booking
    @course = Course.find(params[:course_id])
    @booking = Booking.find_by(course_id: params[:course_id])
  end

#----------> Params empty we don't need a permission for bookings controller
  # private

  # def booking_params
  #   params.require(:booking).permit(:total_price)
  # end
end
