class Booking < ApplicationRecord
  belongs_to :course
  has_one :review
  belongs_to :user
  has_one :teacher, through: :course, source: :user
end
