class Money < ApplicationRecord
  belongs_to :user

  def self.sumprice
    sum(:saving_amount)
  end
end
