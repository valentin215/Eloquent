class Booking < ApplicationRecord
  belongs_to :course
  belongs_to :review
  belong_to :user
end
