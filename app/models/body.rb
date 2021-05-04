class Body < ApplicationRecord
  belongs_to :user

  def self.recentweight
    allweight = Body.pluck(:weight)
    allweight.last
  end
end
