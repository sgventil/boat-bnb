require 'faker'

# users = []
# 6.times do
#   users << User.create!(
#     email: Faker::Internet.unique.email,
#     password: "123456",
#     username: Faker::Name.unique.name
#   )
# end

# # Path to the folder containing boat images
# image_folder_path = "c:/Users/ponto/OneDrive/Desktop/boat-img" # Replace with your actual path

# users.each do |user|
#   num_boats = rand(1..3) # Random number of boats for each user (1 to 3)

#   num_boats.times do
#     boat = Boat.new(
#       price: (200..1000).to_a.sample,
#       rating: (1..5).to_a.sample,
#       name: Faker::Name.unique.name,
#       description: Faker::Hipster.paragraphs.join(" "),
#       location: Faker::Nation.unique.capital_city,
#       availability: Faker::Boolean.boolean,
#       user: user
#     )
#     boat.save!

#     # Attach a picture to the boat
#     image_path = "#{image_folder_path}/#{Faker::Number.unique.between(from: 1, to: 16)}.jpg"
#     boat.photo.attach(io: File.open(image_path), filename: "#{boat.name.parameterize}.jpg")

#     puts "The boat with name #{boat.name} is made"
#   end
# end


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
  email: "user5@gmail.com",
  password: "123456",
  username: "tom doe"
)

10.times do
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs.join(" "),
    location: ["Amalfi Coast", "Cinque Terre", "Costa Smeralda", "Versilia", "Gargano"].sample,
    availability: Faker::Boolean.boolean,
    user: user1
  )

  boat.save!

  puts "The boat with name #{boat.name} is made"
end

10.times do
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs.join(" "),
    location: ["Brighton", "Bournemouth", "Blackpool", "Camber Sands", "St. Ives"].sample,
    availability: Faker::Boolean.boolean,
    user: user2
  )
  boat.save!

  puts "The boat with name #{boat.name} is made"
end

10.times do
boat = Boat.new(
  price: (200..1000).to_a.sample,
  rating: (1..5).to_a.sample,
  name: Faker::Name.unique.name,
  description: Faker::Hipster.paragraphs.join(" "),
  location: ["Zlatni Rat", "Hvares", "Dubrovnikes", "Punta Rata", "Sakarun"].sample,
  availability: Faker::Boolean.boolean,
  user: user3
)
boat.save!

puts "The boat with name #{boat.name} is made"
end

10.times do
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs.join(" "),
    location: ["Mykonos", "Santorini", "Navagio", "Elafonissi", "Koukounaries"].sample,
    availability: Faker::Boolean.boolean,
    user: user4
  )
  boat.save!

  puts "The boat with name #{boat.name} is made"
end

10.times do
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs.join(" "),
    location: ["Costa del Sol", "Barcelona", "Ibiza", "Costa Brava", "Playa de las Canteras"].sample,
    availability: Faker::Boolean.boolean,
    user: user5
  )
  boat.save!

  puts "The boat with name #{boat.name} is made"
end
