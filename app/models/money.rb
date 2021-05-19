class Money < ApplicationRecord
  belongs_to :user

  def self.sumprice
    sumprice = sum(:saving_amount)
  end

  def self.umai
    sumprice / 10
  end
end
