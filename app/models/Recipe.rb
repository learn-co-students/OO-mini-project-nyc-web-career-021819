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

  def self.most_popular
    recipe_array = RecipeCard.all.map do |recipe_card|
      recipe_card.recipe
    end
    recipe_array
    freq_hash = recipe_array.inject(Hash.new(0)) { |h,k| h[k] += 1; h }
    recipe_array.max_by { |k| freq_hash[k] }
  end

  def find_recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
      end
  end

  def users
    self.find_recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def ingredients
    find_recipe_ingredients.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
  end

  #return list of ingredients that are allergens
  def allergens
    unique_allergen_ingredients = Allergen.all.map do |allergen|
      allergen.ingredient
    end.uniq

    (self.ingredients & unique_allergen_ingredients)
  end

  def find_recipe_ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
      end
  end

  #come back later!!!
  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end
  end




end
