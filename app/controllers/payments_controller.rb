class PaymentsController < ApplicationController
  before_action :set_order

  private

  def set_order
    @booking = current_user.bookings.where(state: 'pending').find(params[:booking_id])
  end

end
