class Recipe
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    recipe_array =
    RecipeCard.all.map do |recipe_card|
      recipe_card.recipe
    end
    recipe_array.group_by{|i| i.name}.values.max_by(&:size).first
  end

  def recipe_card_finder
    RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
  end

  def users
    recipe_card_finder.map do |recipe_card|
      recipe_card.user
    end
  end

  def recipe_ingredient_finder
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
  end

  def ingredients
    recipe_ingredient_finder.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
  end

  def allergens
    allergen_ingredients = Allergen.all.map do |allergen|
      allergen.ingredient
    end
    allergen_ingredients & ingredients
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end
  end
end
