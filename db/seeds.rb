require 'faker'

User.destroy_all
Boat.destroy_all
Booking.destroy_all
Review.destroy_all

user1 = User.create!(
  email: "user1@gmail.com",
  password: "123456",
  username: "john doe"
)

user2 = User.create!(
  email: "user2@gmail.com",
  password: "123456",
  username: "jane doe"
)

user3 = User.create!(
  email: "user3@gmail.com",
  password: "123456",
  username: "harry doe"
)

user4 = User.create!(
  email: "user4@gmail.com",
  password: "123456",
  username: "alex doe"
)

user5 = User.create!(
  email: "pontogponto@gmail.com",
  password: "123456",
  username: "Bernanrd the Owner"
)

cloudinary_public_ids = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg",
                         "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg",
                         "17.jpg", "18.jpg", "19.jpg", "20.jpg"
]

20.times do |n|
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs.join(" "),
    location: ["Amalfi Coast", "Cinque Terre", "Costa Smeralda", "Versilia", "Gargano"].sample,
    availability: Faker::Boolean.boolean,
    user: [user1, user2, user3, user4, user5].sample
  )

  public_id_with_extension = cloudinary_public_ids[n]

  image_url = "https://res.cloudinary.com/dhrssjlio/image/upload/v#{n + 1}/boatbnb/#{public_id_with_extension}"

  boat.photo.attach(io: URI.open(image_url), filename: "image.jpg", content_type: "image/jpg")

  boat.save!

  puts "The boat with name #{boat.name} is made, Image URL: #{image_url}"
end
