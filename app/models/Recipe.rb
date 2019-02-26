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

  #def self.most_popular
  #  RecipeCard.all.each do |card|
  #    card.recipe_name == self
  #  end
  #end

  #HELPER
  def recipe_helper
    RecipeCard.all.select do |card|
      card.recipe == self
    end
  end

  def users
    self.recipe_helper.map do |card|
      card.user
    end
  end

  #HELPER 2
  def ingredients_helper
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
  end

  def ingredients
    self.ingredients_helper.map do |recipe_ingredient|
      recipe_ingredient.ingredient
      #binding.pry
    end
  end

  def allergens
    all_allergens = Allergen.all.select do |allergen|
      self.ingredients.include?(allergen.ingredient)
    end
    all_allergens.map do |allergen|
      allergen.ingredient
    end
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

end
