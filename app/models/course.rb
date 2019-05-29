class Course < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :course_days #this returns all the instances of course days
  has_many :bookings
  has_many :reviews, through: :bookings
end












