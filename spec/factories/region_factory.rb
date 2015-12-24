FactoryGirl.define do
  factory :region do
    regions_list = ['Ho Chi Minh', 'Ha Noi', 'Binh Thuan', 'Da Nang', 'Lam Dong']
    initialize_with { Region.find_or_create_by(name: regions_list[0])}
  end
end
