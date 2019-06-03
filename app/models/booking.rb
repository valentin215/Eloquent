class Booking < ApplicationRecord
  belongs_to :course
  has_one :review
  belongs_to :user
  has_one :teacher, through: :course, source: :user
  monetize :price_cents


  # def reviewed?
  #   @booking = Booking.find(params[:id]
  #   return x = true unless @booking.review.nil?
  # end

end
