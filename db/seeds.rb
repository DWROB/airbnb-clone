# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CITIES = %i[lisbon barcelona paris london]

IMAGESURL = [
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126204/exterior_apartment/ksenia-balandina-RCF5KSWb7Ms-unsplash_qdrufj.jpg",
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126204/exterior_apartment/jannis-lucas-KsL8WZJ0CLA-unsplash_smuzho.jpg",
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126202/exterior_apartment/terrah-holly-pmhdkgRCbtE-unsplash_q1yuhq.jpg",
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126201/exterior_apartment/micah-carlson-qN-T-pY17Vc-unsplash_lpbfln.jpg",
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669114828/exterior_apartment/abbilyn-zavgorodniaia-uOYak90r4L0-unsplash_fdnz8q.jpg"
]
puts "deleting records"
User.destroy_all

puts "making new seeds"

5.times do
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
    description: Faker::Lorem.sentence(word_count: 90)
  )

  img_file = URI.open(IMAGESURL.sample)
  apartment.photos.attach(io: img_file, filename: "main_image.jpg", content_type: "image/jpg")
  apartment.save


  booking = Booking.new(
    start_date: Faker::Date.between(from: '2023-01-23', to: '2023-09-25'),
    end_date: Faker::Date.between(from: '2022-11-23', to: '2023-09-25'),
    user_id: user.id,
    apartment_id: apartment.id
  )
  booking.save
end
