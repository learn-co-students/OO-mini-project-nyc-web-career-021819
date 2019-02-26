require_relative '../config/environment.rb'

tony = User.new("Tony")
nate = User.new("Nate")
jessy = User.new("Jessy")

burgers = Recipe.new("burgers")
cake = Recipe.new("cake")
jello = Recipe.new("jello")
apple_pie = Recipe.new("apple pie")

tony.add_recipe_card("2/26", 5, burgers)
nate.add_recipe_card("2/26", 5, burgers)
tony.add_recipe_card("3/26", 8, jello)
tony.add_recipe_card("4/26", 3, cake)
tony.add_recipe_card("5/26", 6, apple_pie)

sugar = Ingredient.new("sugar")
flour = Ingredient.new("flour")
eggs = Ingredient.new("eggs")

cakeIngredient1 = RecipeIngredient.new(sugar, cake)
cakeIngredient2 = RecipeIngredient.new(flour, cake)
cakeIngredient3 = RecipeIngredient.new(eggs, cake)
burgerIngredient1 = RecipeIngredient.new(sugar, burgers)
applePieIngredient1 = RecipeIngredient.new(sugar, apple_pie)

sugarAllergy = Allergen.new(sugar, tony)
flourAllergy = Allergen.new(flour, nate)
sugarAllergy2 = Allergen.new(sugar, jessy)
binding.pry
0
