class User

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def recipes
    RecipeCard.all.select do |recipe|
      recipe.user == self
    end
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end
  end

  def top_three_recipes
    self.recipes.sort_by do |recipe|
      recipe.rating
    end.reverse[0..2]
  end

  def most_recent_recipe
    self.recipes.sort_by do |recipe|
      Date.parse(recipe.date)
    end[-1]
  end

end
