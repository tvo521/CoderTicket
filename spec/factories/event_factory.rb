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
  end
end
