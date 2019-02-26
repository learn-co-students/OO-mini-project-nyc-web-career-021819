require_relative '../config/environment.rb'

naomi = User.new("Naomi")
jessy = User.new("Jessy")

pie = Recipe.new("Pie")
cake = Recipe.new("Cake")
cookie = Recipe.new("Cookie")

recipecard1 = RecipeCard.new(pie, naomi, "1/1", 5)
recipecard2 = RecipeCard.new(cake, jessy, "1/2", 6)
recipecard3 = RecipeCard.new(cookie, naomi, "1/3", 7)
recipecard4 = RecipeCard.new(cake, naomi, "1/3", 8)
recipecard5 = RecipeCard.new(cake, naomi, "1/3", 1)

flour = Ingredient.new("Flour")
egg = Ingredient.new("Egg")
nut = Ingredient.new("Nut")
chocolate = Ingredient.new("Chocolate")
walnuts = Ingredient.new("Walnuts")

recipeingredient1 = RecipeIngredient.new(cake, flour)
recipeingredient2 = RecipeIngredient.new(cake, egg)
recipeingredient3 = RecipeIngredient.new(pie, flour)
recipeingredient4 = RecipeIngredient.new(pie, nut)

allergen1 = Allergen.new(naomi, egg)
allergen2 = Allergen.new(jessy, nut)
allergen3 = Allergen.new(naomi, nut)

ingredient_array1 = [chocolate, walnuts]


binding.pry
0
