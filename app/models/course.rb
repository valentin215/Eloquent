class Course < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :course_days
  has_many :bookings
end
