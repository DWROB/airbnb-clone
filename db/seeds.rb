# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CITIES = %i[lisbon barcelona paris london]

puts "deleting records"
User.destroy_all

puts "making new seeds"

20.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    rating: rand(1..5).floor,
    password: Faker::Internet.password(min_length: 8),
    host: true
  )
  puts user
  user.save

  apartment = Apartment.new(
    location: CITIES.sample,
    rating: rand(1..5).floor,
    user_id: user.id,
    title: Faker::Lorem.sentence(word_count: 4),
    description: Faker::Lorem.sentence(word_count: 90),
    imageURL: "https://images.unsplash.com/photo-1600047509807-ba8f99d2cdde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=992&q=80"
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
