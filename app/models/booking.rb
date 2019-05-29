class Booking < ApplicationRecord
  belongs_to :course
  has_one :review
  belongs_to :user
end
