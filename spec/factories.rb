FactoryGirl.define do
  factory :user do
    first     Faker::Name.first_name
    last      Faker::Name.last_name
    password  'test'
    password_confirmation 'test'
  end
end
