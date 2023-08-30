require 'faker'

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
  n = rand(1..10)
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs.join(" "),
    location: ["Amalfi Coast", "Cinque Terre", "Costa Smeralda", "Versilia", "Gargano"].sample,
    availability: Faker::Boolean.boolean,
    image_filepath: "boat#{n}.jpeg",
    user: user1
  )

  boat.save!

  puts "The boat with name #{boat.name} is made"
end

10.times do
  n = rand(1..10)
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs.join(" "),
    location: ["Brighton", "Bournemouth", "Blackpool", "Camber Sands", "St. Ives"].sample,
    availability: Faker::Boolean.boolean,
    image_filepath: "boat#{n}.jpeg",
    user: user2
  )
  boat.save!

  puts "The boat with name #{boat.name} is made"
end

10.times do
  n = rand(1..10)
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs.join(" "),
    location: ["Zlatni Rat", "Hvares", "Dubrovnikes", "Punta Rata", "Sakarun"].sample,
    availability: Faker::Boolean.boolean,
    image_filepath: "boat#{n}.jpeg",
    user: user3
  )
  boat.save!

  puts "The boat with name #{boat.name} is made"
end

10.times do
  n = rand(1..10)
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs.join(" "),
    location: ["Mykonos", "Santorini", "Navagio", "Elafonissi", "Koukounaries"].sample,
    availability: Faker::Boolean.boolean,
    image_filepath: "boat#{n}.jpeg",
    user: user4
  )
  boat.save!

  puts "The boat with name #{boat.name} is made"
end

10.times do
  n = rand(1..10)
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs.join(" "),
    location: ["Costa del Sol", "Barcelona", "Ibiza", "Costa Brava", "Playa de las Canteras"].sample,
    availability: Faker::Boolean.boolean,
    image_filepath: "boat#{n}.jpeg",
    user: user5
  )
  boat.save!

  puts "The boat with name #{boat.name} is made"
end
