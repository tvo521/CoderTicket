FactoryGirl.define do
  factory :category do
    categories_list = ['Entertainment', 'Learning', 'Everything Else']
    sequence(:name, (0..2).cycle) {|n| categories_list[n]}
  end
end
