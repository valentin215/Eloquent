class InterestCategory < ApplicationRecord
  has_many :interest_tags

  def self.interests
    self.all.pluck(:content).uniq
  end
end
