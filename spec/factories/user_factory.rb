FactoryGirl.define do
  factory :user do
    pwd = 'Foo'
    name Faker::Name.name
    sequence(:email) { |n| "user_#{n}@local.dev"}
    password pwd
    password_confirmation pwd
  end
end
