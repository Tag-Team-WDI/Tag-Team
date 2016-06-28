FactoryGirl.define do
  factory :tag do
    art_id   { Faker::Number.digit }
    user_id  { Faker::Number.digit }
    category { Faker::SlackEmoji.food_and_drink}
  end
end

