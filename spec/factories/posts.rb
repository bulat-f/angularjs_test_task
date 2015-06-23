FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Post ##{n}" }
    body "Post body"
    user
  end
end
