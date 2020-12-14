# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Park.destroy_all
Attraction.destroy_all
News.destroy_all
Item.destroy_all
Avatar.destroy_all

User.create!(
  email: "gamezoneadmin@yopmail.com",
  password: "password",
  first_name: "Game",
  last_name: "Zone",
  city: "Paris",
  identifiant: "GameZone",
  xp: 0,
  avatar_id: Avatar.all.first.id,
  is_admin: true
)

Park.create!(
  opening_times: "9h00",
  closing_times: "19h00"
)

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: Faker::Address.city,
    identifiant: Faker::Name.first_name,
    xp: 0,
    avatar_id: Avatar.all.first.id,
    is_admin: false
  )

  Item.create!(
    name: Faker::Lorem.sentence(word_count: 1),
    description: "password",
    unit_price_ht: 10.00,
    unit_price_tva: 11.00,
    unit_price_ttc: 12.00,
    tva: 20
  )
end

5.times do
  Attraction.create!(
    name: Faker::Lorem.sentence(word_count: 1),
    experience_points: [1500, 1300, 2000].sample,
    maximum_size: [110, 130, 0].sample,
    description: Faker::Lorem.sentence(word_count: 10),
    video_presentation: "https://www.youtube.com/watch?v=frqDT4bD-OE&feature=youtu.be",
    park_id: Park.all.first.id
  )

  News.create!(
    title: Faker::TvShows::Simpsons.quote,
    description: Faker::Lorem.sentence(word_count: 10),
    park_id: Park.all.first.id
  )
end

Avatar.create!(
  url: "https://res.cloudinary.com/gamezonestorage/image/upload/v1607901465/avatars1.png"
)

Avatar.create!(
  url: "https://res.cloudinary.com/gamezonestorage/image/upload/v1607901465/avatar2.png"
)

Avatar.create!(
  url: "https://res.cloudinary.com/gamezonestorage/image/upload/v1607901465/avatars3.png"
)

Avatar.create!(
  url: "https://res.cloudinary.com/gamezonestorage/image/upload/v1607901465/avatars4.png"
)
