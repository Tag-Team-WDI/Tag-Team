require "./app/models/user"
require "faker"

5.times do
  u = User.new
  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = Faker::Internet.free_email
  u.password = "12345"
  u.location = Faker::Address.city
  u.save
end

5.times do
  t = Tag.new
  t.user_id = Faker::Number.digit
  t.art_id = Faker::Number.digit
  t.category = Faker::SlackEmoji.food_and_drink
  t.save
end

5.times do
  a = Art.new
  a.user_id = Fake::Number.digit
  a.save
end