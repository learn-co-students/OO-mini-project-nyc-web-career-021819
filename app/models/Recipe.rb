class Recipe
  attr_accessor :name
  @@all = []

  def initialize(name)
    self.name = name
    Recipe.all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
  end

  def users
    recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def recipe_ingredients
    RecipeIngredient.all.select {|recipeingredient| recipeingredient.recipe == self}
  end

  def ingredients
    recipe_ingredients.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
  end

  def allergens
    allergens_ingredients = Allergen.all.select do |allergen|
      ingredients.include?(allergen.ingredient)
    end
    allergens_ingredients.map do |allergens_ingredient|
      allergens_ingredient.ingredient
    end.uniq
  end

  def add_ingredients(ingrediet_instances)
    ingrediet_instances.each do |ingrediet_instance|
      _RecipeIngredient.new(self, ingrediet_instance)
    end
  end

  def self.most_popular
    recipecard_count = {}
    RecipeCard.all.each do |recipeecard|
      recipecard_count[recipecard.recipe] ||= 1
      recipecard_count[recipecard.recipe] += 1
    end
    recipecard_count.max_by {|recipecard, count| count}[0]
  end


end
