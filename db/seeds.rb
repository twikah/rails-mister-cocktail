require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying ingredients...'

Ingredient.destroy_all

puts 'Importing ingredients...'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
serialized_ingredients = open(url).read
ingredients = JSON.parse(serialized_ingredients)

# ingredients['drinks'][0]["strIngredient1"]
ingredients['drinks'].each do |ing|
  Ingredient.create(name: ing["strIngredient1"])
end

puts 'Done!'
