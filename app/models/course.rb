class Course < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :course_days #this returns all the instances of course days
  has_many :bookings
  has_many :reviews, through: :bookings
  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  monetize :price_cents
  attr_accessor :start_time, :end_time

  def total_week_hours
    total = 0
    course_days.first(1).each do |course_day|
      total += course_day.end_time.strftime('%I:%M%p').to_i - course_day.start_time.strftime('%I:%M%p').to_i
    end
    return total
  end

  def self.levels
    self.all.pluck(:level).uniq
  end
  # def spaces_left
  #   Course.all.each do |course|
  #     course.capacity - course.bookings.count
  #   end

  # end

  # def course_days
  #   CourseDay.where(course_id: self.id)
  # end
end

# find # lazy -> SOON AS I FIND ONE, I STOP.
# where # eager -> I KEEP ON DOING IT AS LONG AS I CAN
