FactoryGirl.define do
  factory :ticket_type do
    event

    trait :type_a do
      price 500_000
      name 'Type A'
      max_quantity 10
    end

    trait :type_b do
      price 350_000
      name 'Type B'
      max_quantity 50
    end

    trait :type_c do
      price 200_000
      name 'Type C'
      max_quantity 100
    end
  end
end
