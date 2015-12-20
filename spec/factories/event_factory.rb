FactoryGirl.define do
  factory :event do
    t = DateTime.now
    starts_at t
    ends_at t + 2
    venue
    hero_image_url 'http://loremflickr.com/1040/400'
    extended_html_description Faker::Lorem.paragraph(4)
    category
    sequence(:name) {|n| "Event #{n}"}

    trait :with_ticket_types do
      after :create do |event|
        [:type_a, :type_b, :type_c].each {|type| create(:ticket_type, type, event: event)}
      end
    end
  end
end
