class Booking < ApplicationRecord
  belongs_to :course
  has_one :review
  belongs_to :user
  has_one :teacher, through: :course, source: :user


# def reviewed?
#   @booking = Booking.find(params[:id)
#   if @booking.review
#   end
# end


end
