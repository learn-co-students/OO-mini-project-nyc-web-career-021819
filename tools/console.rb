require_relative '../config/environment.rb'

spaghettimeatballs = Recipe.new("Spaghetii and Meatballs")
pizza = Recipe.new("Pizza")
sandwich = Recipe.new("Sandwich")
salad = Recipe.new("Salad")
bowlofnoodles = Recipe.new("Bowl O' Noodles")

tomato = Ingredient.new("tomato")
noodle = Ingredient.new("noodle")
spaghetti = Ingredient.new("spaghetti")
meatball = Ingredient.new("meatball")
cheese = Ingredient.new("cheese")
bread = Ingredient.new("bread")
turkey = Ingredient.new("turkey")
lettuce = Ingredient.new("lettuce")

spaghettimeatballs.add_ingredients([tomato, spaghetti, meatball])
pizza.add_ingredients([cheese, tomato, bread])
sandwich.add_ingredients([bread, lettuce, tomato, turkey, cheese])
salad.add_ingredients([lettuce, tomato, cheese])
bowlofnoodles.add_ingredients([noodle])




boyardee = User.new("Chef Boyardee")
guy = User.new("Guy Fieri")
garfield = User.new("Garfield")

guy.declare_allergen(meatball)
guy.declare_allergen(lettuce)
garfield.declare_allergen(tomato)
garfield.declare_allergen(turkey)
boyardee.declare_allergen(meatball)

guy.add_recipe_card(bowlofnoodles, "1919-01-12", 2)
guy.add_recipe_card(pizza, "1993-05-23", 6)
boyardee.add_recipe_card(sandwich, "2019-02-27", 3)
garfield.add_recipe_card(spaghettimeatballs, "1999-02-11", -2)
guy.add_recipe_card(salad, "2020-01-01", 1)
guy.add_recipe_card(spaghettimeatballs, "1994-05-23", 4)



#RECIPE TESTS
#Recipe.most_popular #-passed, expect spaghettimeatballs
#spaghettimeatballs.ingredients to return ingredients within
#spaghettimeatballs.users # -passed expect to return guy & garfield
# spaghettimeatballs.ingredients #expect array of ingredient objects
binding.pry
0
