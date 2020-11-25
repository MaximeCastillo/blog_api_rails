# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#Création de quelques users
8.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create!(
    email: "#{first_name}.#{last_name}@yopmail.fr",
    password: first_name+"."+last_name
  )
end
puts "-> quelques users fictifs ont été créés"

# Création de quelques articles
20.times do
  article = Article.create!(
    title: Faker::Lorem.sentence(word_count: 2),
    content: Faker::ChuckNorris.fact,
    user_id: User.all.sample.id
  )
end
puts "-> quelques articles fictifs ont été créés"