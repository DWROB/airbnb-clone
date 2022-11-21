# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CITIES = %i[lisbon barcelona paris london]

puts "deleting records"

puts "making new seeds"

25.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    rating: rand(1..5).floor,
    password: Faker::Internet.password(min_length: 8)
  )
  puts user
  user.save

  apartment = Apartment.new(
    location: CITIES.sample,
    rating: rand(1..5).floor,
    user_id: user.id
  )
  apartment.save

  booking = Booking.new(
    start_date: Faker::Date.between(from: '2023-01-23', to: '2023-09-25'),
    end_date: Faker::Date.between(from: '2022-11-23', to: '2023-09-25'),
    user_id: user.id,
    apartment_id: apartment.id
  )
  booking.save
end
