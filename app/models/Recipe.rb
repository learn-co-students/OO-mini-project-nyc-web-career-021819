class Recipe

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select do |recipe|
      recipe.recipe == self
    end
  end

  def users
    recipe_cards.map do |recipe|
      recipe.user
    end
  end

  def self.most_popular
      recipe_arr = []
      RecipeCard.all.each do |recipe|
        recipe_arr << recipe.recipe
      end

      recipe_hash = {}
      recipe_arr.each do |recipe|
        if recipe_hash.has_key?(recipe.name)
          recipe_hash[recipe.name] += 1
        else
          recipe_hash[recipe.name] = 1
        end
      end
      most_popular = recipe_hash.sort_by do |recipe, count|
        count
      end.last.first

      recipe_arr.find do |recipe|
        recipe.name == most_popular
      end
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |recipe|
      recipe.recipe == self
    end
  end

  def ingredients
    recipe_ingredients.map do |recipe|
      recipe.ingredient
    end
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end
    self.ingredients
  end

  def allergens
    all_allergens = Allergen.all.select do |allergen|
      self.ingredients.include?(allergen.ingredient)
    end
    all_allergens.map do |allergen|
      allergen.ingredient
    end.uniq
  end


end
