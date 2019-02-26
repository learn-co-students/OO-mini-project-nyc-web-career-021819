require_relative '../config/environment.rb'

spaghetti_meatballs = Recipe.new("Spaghetti & Meatballs")
m_and_c = Recipe.new("Mac & Cheese")
pb_j = Recipe.new("PB&J")

will = User.new("Will")
matt = User.new("Matt")
dave = User.new("Dave")

card_1 = RecipeCard.new(will, spaghetti_meatballs, 1.1, 1)
card_2 = RecipeCard.new(matt, spaghetti_meatballs, 1.1, 2)
card_3 = RecipeCard.new(will, m_and_c, 1.2, 3)
card_4 = RecipeCard.new(dave, m_and_c, 1.1, 4)
card_5 = RecipeCard.new(will, pb_j, 1.2, 5)
card_6 = RecipeCard.new(matt, pb_j, 1.3, 6)
card_7 = RecipeCard.new(dave, pb_j, 1.3, 9)

peanut_butter = Ingredient.new("Peanut Butter")
jelly = Ingredient.new("Jelly")
macaroni = Ingredient.new("Macaroni")
cheese = Ingredient.new("Cheese")
spaghetti = Ingredient.new("Spaghetti")
meatballs = Ingredient.new("Meatballs")

ing_1 = RecipeIngredient.new(peanut_butter, pb_j)
ing_2 = RecipeIngredient.new(jelly, pb_j)
ing_3 = RecipeIngredient.new(macaroni, m_and_c)
ing_4 = RecipeIngredient.new(cheese, m_and_c)
ing_5 = RecipeIngredient.new(spaghetti, spaghetti_meatballs)
ing_6 = RecipeIngredient.new(meatballs, spaghetti_meatballs)

peanut = Allergen.new(dave, peanut_butter)
lactose = Allergen.new(dave, cheese)
gluten = Allergen.new(matt, macaroni)
veg = Allergen.new(will, meatballs)
peanut_2 = Allergen.new(matt, peanut_butter)

binding.pry
0
