roy# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'Cleaning database...'
# Ingredient.destroy_all
# puts 'Creating database...'
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# puts 'Finished!'
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

puts 'Creating ingredients'

require 'json'
require 'faker'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

drinks = user["drinks"]

  num = 0
  ingredients = []
70.times do
  name = drinks[num]["strIngredient1"]
  ingredient = Ingredient.new(name: name)
  ingredient.save!
  ingredients << ingredient
  num += 1
end
  ingredients.sort!

puts "ingredients created"

# puts "cocktails created"

# 9.times do
#   cocktail = Cocktail.create(name: Faker::Beer.name)
#  5.times do
#     Dose.create(cocktail: cocktail, ingredient: ingredients.sample, description: (1..5).to_a.sample.to_s)
#   end
# end
