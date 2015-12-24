FactoryGirl.define do
  factory :category do
    categories_list = ['Entertainment', 'Learning', 'Everything Else']
    initialize_with { Category.find_or_create_by(name: categories_list[0])}
  end
end
