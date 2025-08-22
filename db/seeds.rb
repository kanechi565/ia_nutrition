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
Chat.destroy_all
Objective.destroy_all
User.destroy_all

puts " creation de seeds"
user1 = User.create!(name: 'Jonathan', email: "Jonathan@gmail.com",
   password: "password", height:180, weight: 75.3, gender: "homme", age: 24)
user2 = User.create!(name: 'Charles', email: "Charles@gmail.com", password: "password4",
   height: 183, weight: 79.3, gender: "homme", age: 27)

puts "reation d'objectif"

objective1 = Objective.create!(
  name: "Perte de poids",
  description: "Je souhaite suivre un programme adapté pour favoriser ma perte de poids.",
  user: user1
)
objective2 = Objective.create!(
  name: "Prise de masse",
  description: "Mon objectif principal en ce moment est la prise de masse musculaire.",
  user: user1
)
objective3 = Objective.create!(
  name: "Végétarien",
  description: "Étant végétarien, je recherche des repas équilibrés sans viande ni poisson.",
  user: user2
)
objective4 = Objective.create!(
  name: "Vegan",
  description: "Mon alimentation est entièrement vegan, je ne consomme donc aucun produit d’origine animale.",
  user: user1
)
objective5 = Objective.create!(
  name: "Planning repas",
  description: "Un planning de repas hebdomadaire m’aiderait à mieux organiser mon alimentation.",
  user: user2
)
objective6 = Objective.create!(
  name: "Flexitarien",
  description: "Je me considère flexitarien, car je limite la viande mais j’en consomme encore occasionnellement",
  user: user1
)


puts 'seed chats'

Chat.create!(name: 'je veux perdre du poids', objective: objective1)
Chat.create!(name: 'je veux prendre du muscle', objective: objective2)
Chat.create!(name: 'je veux manger végétarien', objective: objective3)
Chat.create!(name: 'je veux suivre un régime vegan', objective: objective4)
Chat.create!(name: 'je veux un planning repas', objective: objective5)
Chat.create!(name: 'je veux manger flexitarien', objective: objective6)
puts "seeds done"
