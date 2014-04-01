# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :check_list_item do
    check_list_id 1
    check_id 1
    position 1
  end
end
