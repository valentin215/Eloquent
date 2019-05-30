class Review < ApplicationRecord
  belongs_to :booking
  after_create :update_teacher_rating
  # def average_rating
  #   @bookings = Review.all.map do |review|
  #     review.bookings
  #   end

  #   @teachers = @bookings.flatten.map do |teacher|
  #     booking.course.user
  #   end

# this returns the teachers on all those bookings
# we want to get all reviews ever
# then we want to select all the ratings. This will be an array.
# then we want to sum the all the ratings in the array
# then we need to count the number of items in the array
# then we need to divide the sum by the number of items
  # end

  private

  def update_teacher_rating
    teacher = booking.course.user
    ratings = teacher.teacher_reviews.pluck(:rating)
    teacher.teacher_rating = ratings.compact.sum / ratings.compact.count
    teacher.save
  end

  #same as:
  #   ratings = []

  #   ratings = Booking.joins(:courses).where('courses.user_id = ?', teacher.id).map { |booking| booking.review.rating }

  # #  teacher.courses.each do |course|
  #  #   course.bookings.each do |booking|
  #   #    ratings << booking.review.rating
  #    # end
  #   # end
end
