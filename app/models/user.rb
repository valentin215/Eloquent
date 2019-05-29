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
         :recoverable, :rememberable, :validatable

  has_many :user_interests
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :bookings
  has_many :courses, through: :bookings # FOR STUDENTS
  has_many :courses # FOR TEACHERS
  has_many :reviews, through: :bookings # Student review a course
  has_many :interest_tags, through: :user_interests

  has_many :teacher_reviews, through: :courses, source: :reviews

end
