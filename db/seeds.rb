require 'json'
require 'open-uri'

hash_cocktails = {}

url_cocktails  = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail"
array_cocktails = []

json_cocktails = JSON.parse(open(url_cocktails).read)
json_cocktails["drinks"].each do |cocktail|
  array_cocktails << cocktail["strDrink"]
end

array_cocktails.delete("Empellón Cocina's Fat-Washed Mezcal")

array_cocktails.each do |cocktail|
  begin
    url_cocktail_details = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail}"
    rescue URI::InvalidURIError
    URI.parse(URI.escape(url_cocktail_details))
  end

  # p "The cocktail name is #{cocktail}"
  hash_cocktails.store(cocktail,[])
  json_cocktail_details = JSON.parse(open(url_cocktail_details).read)
  json_cocktail_details["drinks"].each do  |detail|
    # p "The ingredients are.."
    # p detail["strIngredient1"]
    hash_cocktails[cocktail] << detail["strIngredient1"]
    # p detail["strIngredient2"]
    hash_cocktails[cocktail] << detail["strIngredient2"]
     # p detail["strDrinkThumb"]
    hash_cocktails[cocktail] << detail["strDrinkThumb"]
  end

  # hash_cocktails.each do |key, value|
  #   Cocktail.create(name: key, pic: value[2])
  # end

  # p Cocktail.first

end

# url_ingredients = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# url_cocktails = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'

# apicall_ingredients = open(url_ingredients).read
# json_ingredients = JSON.parse(apicall_ingredients)

# apicall_cocktails = open(url_cocktails).read
# json_cocktails = JSON.parse(apicall_cocktails)

# ingredients = []
# cocktail_names = []
# cocktail_pics = []

# json_ingredients['drinks'].each do |ingredient|
#   ingredients << ingredient['strIngredient1']
# end

# json_cocktails['drinks'].each do |cocktail|
#   cocktail_names << cocktail['strDrink']
#   cocktail_pics << cocktail['strDrinkThumb']
# end

# 10.times do
#   Cocktail.create(name: cocktail_names.sample)
# end

# 10.times do
#  Ingredient.create(name: ingredients.sample)
# end

DOSES = %w(200ml 300ml 2spoon ciao aCupOf)

50.times do
  Dose.create(cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample, description: DOSES.sample)
end
