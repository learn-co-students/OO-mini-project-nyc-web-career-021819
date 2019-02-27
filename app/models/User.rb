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

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(date, rating, self, recipe)
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient, self)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end
  end

  def allergen_ingredients
    self.allergens.map do |allergen|
      allergen.ingredient
    end
  end

  def find_recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end



  def top_three_recipes
   ranked_recipe_cards = self.find_recipe_cards.sort_by do |recipe_card|
      0 - recipe_card.rating
    end
    top_recipe_cards = ranked_recipe_cards.slice(0,3)
    top_recipe_cards.map do |recipe_card|
      recipe_card.recipe
    end
  end

  # def most_recent_recipe
  #    recent_recipe_cards = self.find_recipe_cards.sort_by do |recipe_card|
  #       recipe_card.date
  #       binding.pry
  #     end
  #     recent_recipe_cards
  # end


  def most_recent_recipe
    date = "0000-01-01"
    binding.pry
    recipe = nil
    self.find_recipe_cards.each do |recipe_card|
      if Date.parse(recipe_card.date) > date
        Date.parse(date) = Date.parse(recipe_card.date)
        recipe = recipe_card
      end
    end
    recipe
    date
  end


def safe_recipes
  safe_recipes = []
  Recipe.all.each do |recipe|
    if (recipe.ingredients & self.allergen_ingredients).empty?
      safe_recipes << recipe
    end
  end
  safe_recipes
end

end
