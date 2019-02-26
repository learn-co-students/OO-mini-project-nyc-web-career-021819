require_relative '../config/environment.rb'
require 'pry'

alex = User.new("Alex")
vicky = User.new("Vicky")
adam = User.new("Adam")
billy = User.new("Billy")

macncheese = Recipe.new("macncheese")
pizza = Recipe.new("pizza")
soup = Recipe.new("soup")
bread = Recipe.new("bread")

alpizza = RecipeCard.new(alex, pizza, 7, "1/1")
alsoup = RecipeCard.new(alex, bread, 7, "1/1")
vsoup = RecipeCard.new(vicky, soup, 8, "1/1")
adbread = RecipeCard.new(adam, bread, 9, "1/1")
bmacncheese = RecipeCard.new(billy, macncheese, 3, "1/1")

vicky.add_recipe_card(pizza, 5, "2/2")
vicky.add_recipe_card(bread, 2, "2/3")
vicky.add_recipe_card(macncheese, 3, "2/4")

peanut = Ingredient.new("peanut")
cheese = Ingredient.new("cheese")
gluten = Ingredient.new("gluten")
tomato = Ingredient.new("tomato")

pizza_cheese = RecipeIngredient.new(pizza, cheese)
bread_peanut = RecipeIngredient.new(bread, peanut)

vicky.declare_allergen(peanut)
alex.declare_allergen(peanut)
vicky.declare_allergen(gluten)
alex.declare_allergen(cheese)
adam.declare_allergen(peanut)
billy.declare_allergen(tomato)
vicky.declare_allergen(tomato)
alex.declare_allergen(gluten)





binding.pry
0
