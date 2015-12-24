FactoryGirl.define do
  factory :venue do
    sequence(:name) {|n| "Venue #{n}"}
    full_address Faker::Address.street_address
    region
  end
end
