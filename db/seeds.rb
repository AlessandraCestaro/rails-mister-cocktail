require 'json'
require 'open-uri'

url_ingredients = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
url_cocktails = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'

apicall_ingredients = open(url_ingredients).read
json_ingredients = JSON.parse(apicall_ingredients)

apicall_cocktails = open(url_cocktails).read
json_cocktails = JSON.parse(apicall_cocktails)

ingredients = []
cocktail_names = []
cocktail_pics = []

json_ingredients['drinks'].each do |ingredient|
  ingredients << ingredient['strIngredient1']
end

json_cocktails['drinks'].each do |cocktail|
  cocktail_names << cocktail['strDrink']
  cocktail_pics << cocktail['strDrinkThumb']
end

# p ingredients
# p cocktail_names
# p cocktail_pics

10.times do
  Cocktail.create(name: cocktail_names.sample)
end

10.times do
 Ingredient.create(name: ingredients.sample)
end

A = %w(200ml 300ml 2spoon ciao aCupOf)

10.times do
  Dose.create(cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample, description: A.sample)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
