# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "dogsitter"
require "dog"
require "stroll"
require "city"
require 'faker'
# Reset all data into database
Dog.destroy_all
Stroll.destroy_all
Dogsitter.destroy_all
City.destroy_all

# Generate 3 objects City
3.times do |i|
  City.create!(
      name: Faker::Address.city
  )
end

# Generate 10 objects into database
10.times do |i|
  dogsitter = Dogsitter.create!(
      first_name: Faker::Name.name.first,
      last_name: Faker::Name.name.last,
      #age: rand(18..60),
      city: City.all.sample
  )
  dog = Dog.create!(
      name: Faker::FunnyName.name,
     # pedigree: ["Chiwawa", "Caniche", "Bichon Maltais", "Golden Retriever", "Labradaor", "Pitbull", "Bulldog"].sample,
      city: City.all.sample
  )
  Stroll.create!(
      place: Faker::Address.full_address,
      date: Faker::Date.between(from: 2.days.ago, to: 1.year.after),
      dog: dog,
      dogsitter: dogsitter,
  )

end
  puts "La basse de données a été bien créée"