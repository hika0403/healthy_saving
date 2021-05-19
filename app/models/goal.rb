class Goal < ApplicationRecord
  with_options presence: true do
    validates :weight_goal
    validates :saving_goal
    validates :purpose
    validates :period
  end

  with_options numericality: true do
    validates :weight_goal
    validates :saving_goal
  end

  belongs_to :user
end
