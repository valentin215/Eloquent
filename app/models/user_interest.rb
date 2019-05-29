class UserInterest < ApplicationRecord
  belongs_to :interest_tag
  belongs_to :user
  validates :user, uniqueness: { scope: :interest_tag }
end
