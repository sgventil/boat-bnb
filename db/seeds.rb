# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

user1 = User.create!(
  email: "user1@gmail.com",
  password: "123456",
  username: "john doe"
)

10.times do
  boat = Boat.new(
    price: (200..1000).to_a.sample,
    rating: (1..5).to_a.sample,
    name: Faker::Name.name,
    description: "Put Description Here",
    location: Faker::Nation.capital_city,
    availability: Faker::Boolean.boolean,
    user: user1
  )
  boat.save!

  puts "The boat with name #{boat.name} is made"
end
