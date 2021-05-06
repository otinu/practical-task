# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name = Faker::Name.name[0...20]
  email    = Faker::Internet.email
  postcode = rand(1111111..5555555)
  prefecture_name = "東京都"
  address_city = "新宿区"
  address_street = "新宿東ダミーXXX"
  password = "password"
  User.create!(name: name, 
               email: email,
               postcode: postcode,
               prefecture_name: prefecture_name,
               address_city: address_city,
               address_street: address_street,
               password: password)
end

10.times do |n|
  title = Faker::Book.title
  body  = Faker::Book.genre
  Book.create!(title: title, body: body, user_id: 1)
end