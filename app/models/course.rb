class Course < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :course_days
  has_many :bookings

  def total_week_hours
    total = 0
    course_days.each do |course_day|
      total += course_day.end_time - course_day.start_time
    end
    return total
  end

  # def course_days
  #   CourseDay.where(course_id: self.id)
  # end
end

# find # lazy -> SOON AS I FIND ONE, I STOP.
# where # eager -> I KEEP ON DOING IT AS LONG AS I CAN
