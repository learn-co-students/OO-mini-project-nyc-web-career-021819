class User

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, self, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
     variable = Allergen.all.select do |allergen|    #this can be made into a helper
      allergen.user == self
    end
    variable.map do |allergen|
      allergen.ingredient
    end
  end

  def top_three_recipes
    self.recipes.sort_by do |recipe|
      recipe.rating
    end.last(3)
  end

  def most_recent_recipe
    self.recipes.sort_by do |recipe|
      recipe.date
    end.last
  end



end
