class Booking < ApplicationRecord
  belongs_to :course
  belongs_to :review
  belongs_to :user
end
