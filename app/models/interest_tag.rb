class InterestTag < ApplicationRecord
  belongs_to :interest_category
  has_many :user_interests
  has_many :users, through: :user_interests

  def self.interests
    self.all.pluck(:content).uniq
  end
end
