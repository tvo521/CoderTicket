FactoryGirl.define do
  factory :region do
    regions_list = ['Ho Chi Minh', 'Ha Noi', 'Binh Thuan', 'Da Nang', 'Lam Dong']
    sequence(:name, (0..4).cycle) {|n| regions_list[n]}
  end
end
