FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_no_#{n}@mail.com" }

    password              'password123'
    password_confirmation 'password123'
  end
end
