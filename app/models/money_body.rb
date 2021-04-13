class MoneyBody
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :saving_amount, :day, :text, :weight, :user_id

  with_options presence: true do
    validates :saving_amount, numericality: { only_integer: true }
    validates :day
    validates :user_id
  end

  validates :weight, presence: true, format: { with: /\A[0-9]{1,3}\z/ }

  def save
    Money.create(saving_amount: saving_amount, day: day, text: text, user_id: user_id)
    Body.create(weight: weight, user_id: user_id)
  end

end