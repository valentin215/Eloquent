class User < ApplicationRecord
 # validates :name, presence: true
 # validates :biography, presence: true
 # validates :native_language, presence: true
 # validates :photo, presence: true
 # validates :password, presence: true
 # validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
 # validates :nationality, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_interests
  has_many :user_languages
  has_many :languages, through: :user_languages

  has_many :student_courses, through: :bookings, source: 'Course' # FOR STUDENTS
  has_many :courses
  # FOR TEACHERS
  has_many :bookings
  has_many :teacher_bookings, through: :courses, source: :bookings

  has_many :reviews, through: :bookings # Student review a course
  has_many :interest_tags, through: :user_interests

  has_many :teacher_reviews, through: :courses, source: :reviews
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, uniqueness: true

  validates :nationality, presence: true, on: :update
  validates :native_language, presence: true, on: :update

  # current_user.teacher_reviews

  def teacher_reviews_for_show
    reviews = []
    courses.each do |course|
      course.bookings.each do |booking|
        if booking.review.present?
        reviews << booking.review
        end
      end
    end
    reviews
  end

  def student?
    courses.empty?
  end

  def teacher?
    !student?
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name # assuming the user model has a name
      user.photo = auth.info.photo # assuming the user model has an image
    end
  end

end

# User.new.student_courses
