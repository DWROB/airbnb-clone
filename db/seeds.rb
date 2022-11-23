# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CITIES = %i[lisbon barcelona paris london]
counter_seed = 0
IMAGESINTERIOR1 = [
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669214027/interior_apartment/minh-pham-OtXADkUh3-I-unsplash_zmnshz.jpg",
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669214021/interior_apartment/armin-djuhic-mcL2f-J74GY-unsplash_aiuron.jpg"]
  IMAGEINTERIOR2 = [
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669214015/interior_apartment/jason-briscoe-UV81E0oXXWQ-unsplash_qwybki.jpg",
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669214005/interior_apartment/patrick-perkins-3wylDrjxH-E-unsplash_sshba2.jpg"
  ]
  IMAGEINTERIOR3 = [
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669213994/interior_apartment/patrick-perkins-3wylDrjxH-E-unsplash_km5aah.jpg",
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126199/interior_apartment/francesca-tosolini-qnSTxcs0EEs-unsplash_h4ohpg.jpg"
  ]
  IMAGEINTERIOR4= [
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126198/interior_apartment/rhema-kallianpur-jbJ-_hw2yag-unsplash_g0iuba.jpg",
  "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126198/interior_apartment/rhema-kallianpur-jbJ-_hw2yag-unsplash_g0iuba.jpg"
  ]
  IMAGEINTERIOR5= [
    "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126198/interior_apartment/rhema-kallianpur-jbJ-_hw2yag-unsplash_g0iuba.jpg",
    "https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669112360/interior_apartment/outsite-co-R-LK3sqLiBw-unsplash_oznuy3.jpg"
  ]
IMAGESURL = [["https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126201/exterior_apartment/micah-carlson-qN-T-pY17Vc-unsplash_lpbfln.jpg", IMAGESINTERIOR1],
  ["https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126201/exterior_apartment/stephen-leonardi-XKIO6ZgCObo-unsplash_m9pru7.jpg", IMAGEINTERIOR2],
  ["https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126201/exterior_apartment/chi-m-R1uiDu8vBh0-unsplash_i1cb1b.jpg", IMAGEINTERIOR3 ],
  ["https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126199/exterior_apartment/vu-anh-7hHTOtSMTKs-unsplash_qy7i66.jpg", IMAGEINTERIOR4 ],
  ["https://res.cloudinary.com/dk2w7ocuc/image/upload/v1669126198/exterior_apartment/diego-carneiro-w4XtcQsBVeI-unsplash_tb2iwa.jpg" ,IMAGEINTERIOR5]

]
puts "deleting records"
User.destroy_all

puts "making new seeds"



IMAGESURL.each do |image|
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
    counter_seed += 1

    apartment = Apartment.new(
      address: CITIES.sample,
      rating: rand(1..5).floor,
      user_id: user.id,
      title: Faker::Lorem.sentence(word_count: 4),
      description: Faker::Lorem.sentence(word_count: 90)
    )
    img_file = URI.open(image[0])
    apartment.photos.attach(io: img_file, filename: "main_image.jpg", content_type: "image/jpg")
    apartment.save
    image[1].each do |sub_image|
      img_file = URI.open(sub_image)
      apartment.photos.attach(io: img_file, filename: "main_image.jpg", content_type: "image/jpg")
    end
    booking = Booking.new(
    start_date: Faker::Date.between(from: '2023-01-23', to: '2023-09-25'),
    end_date: Faker::Date.between(from: '2022-11-23', to: '2023-09-25'),
    user_id: user.id,
    apartment_id: apartment.id
  )
  booking.save
end
