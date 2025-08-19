# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts " nettoyer user"
User.destroy_all

puts " creation de seeds"
user1 = User.create!(name: 'Jonathan', email: "Jonathan@gmail.com",
   password: "password", height:180, weight: 75.3, gender: "homme", age: 24)
user2 = User.create!(name: 'Charles', email: "Charles@gmail.com", password: "password4",
   height: 183, weight: 79.3, gender: "homme", age: 27)


puts "reation d'objectif"

Objective.create!(name: "perte de poids", description:"perte de poids intensive pour remise en forme", user:user1)
Objective.create!(name: "prise de masse", description:"prise de masse intensive", user:user2)

puts "seeds done"
