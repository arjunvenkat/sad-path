# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :roadblock_check do
    check_id 1
    roadblock_id 1
    completed_at "2014-03-29 17:35:32"
    solved_it false
  end
end
