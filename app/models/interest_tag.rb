class InterestTag < ApplicationRecord
  belongs_to :interest_category
  has_many :user_interest
end
