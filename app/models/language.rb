class Language < ApplicationRecord
  has_many :courses
  has_many :user_languages
end
