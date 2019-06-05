class PaymentsController < ApplicationController
  # before_action :set_booking

def new
  @course = Course.find(params[:course_id])
  @booking = Booking.new
end

def create

    @user = current_user
    @course = Course.find(params[:course_id])
    @booking = Booking.new(amount: @course.price, user: current_user)
    @booking.course = @course
    @booking.user = current_user
    # @booking.total_price = @booking.course.price.to_i * @course.bookings.count
    @booking.save


  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,
    amount:       @course.price_cents,
    description:  "Payment for course #{@course}",
    currency:     @course.price.currency
  )

  @booking.update(payment: charge.to_json, state: 'paid')
  redirect_to  booking_path(@booking)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_booking_payment_path(@booking)
end

def show
  @booking
end


  private

  # def set_booking
  #   @booking = current_user.bookings.where(state: 'pending').find(params[:booking_id])
  # end
end
