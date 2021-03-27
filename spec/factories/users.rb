FactoryBot.define do
  factory :user do
    nickname              { 'hikaru' }
    email                 { Faker::Internet.free_email }
    password              { 'aaBB1234' }
    password_confirmation { password }
    family_name           { '小松' }
    given_name            { 'ひかる' }
    birth_day             { '1999-01-01' }
  end
end
