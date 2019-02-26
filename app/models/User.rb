class User
  attr_accessor :name

  @@all = []

  def initialize(name)
    self.name = name
    User.all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end

  def recipes
    recipe_cards.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def add_recipe_card(recipe, rating, date)
    RecipeCard.new(self, recipe, rating, date)
  end

  def top_three_recipes
    recipe_cards.sort_by do |recipe_card|
      recipe_card.rating
    end.pop(3)
  end

  def most_recent_recipe
    recipe_cards.max_by {|recipe_card| recipe_card.date}.recipe
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient, self)
  end

  def allergens
    Allergen.all.select {|allergen| allergen.user == self}
  end

  def allergen_ingredients
    allergens.map do |allergen|
      allergen.ingredient
    end
  end

  def recipe_ingredients
    recipes.map do |recipe|
      recipe.ingredients
    end.flatten
  end

  def safe_recipes
    safe_recipes = recipes.map {|recipe| recipe}
    # recipe_ingredients.exclude?(allergen_ingredients)
    # allergins_in_recipes = allergen_ingredients.select do |all_ingredient|
    #   recipe_ingredients.include?(all_ingredient)
    # end
    not_safe_recipes = []
      recipes.each do |recipe|
        allergen_ingredients.each do |all_ingredient|
          if recipe.ingredients.include?(all_ingredient)
            not_safe_recipes <<  recipe
          else
          end
        end
      end

     not_safe_recipes.map do |not_safe_recipe|
      safe_recipes.delete(not_safe_recipe)
      safe_recipes
    end
  end

end
