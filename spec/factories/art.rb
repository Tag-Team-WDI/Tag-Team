FactoryGirl.define do
  factory :art do
    user_id { Faker::Number.digit }
  end
end