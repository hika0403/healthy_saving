FactoryBot.define do
  factory :goal do
    weight_goal { '50' }
    saving_goal { '500000' }
    purpose     { 'こんにちは' }
    period      { '2040-01-02' }

    association :user
  end
end
