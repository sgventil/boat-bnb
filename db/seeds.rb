# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Boat.destroy_all

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
user1 = User.create!(
  email: "user1@gmail.com",
  password: "123456",
  username: "john doe"
)

10.times do
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.unique.name,
    description: Faker::Hipster.paragraphs,
    location: Faker::Nation.unique.capital_city,
    availability: Faker::Boolean.boolean,
    user: user1
  )
  boat.save!

  puts "The boat with name #{boat.name} is made"

end
