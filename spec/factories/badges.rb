# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :badge do
    name "MyString"
    description "MyText"
    image "MyString"
    free_to_award false
    owner_id 1
  end
end
