class User
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def recipes
    RecipeCard.all.select do |recipe|
      recipe.user == self
    end
  end

  def top_three_recipes
    self.recipes.sort_by {|recipe| recipe.rating}.reverse[0..2]
  end

  def most_recent_recipe
    self.recipes.sort_by {|recipe| recipe.date}.last
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def get_allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end
  end

  def allergens
    get_allergens.map do |allergen|
      allergen.ingredient
    end
  end

  def safe_recipes
    safe_recipes = []
    unsafe_recipes = []
    Recipe.all.each do |recipe|
        # binding.pry
        # if recipe.ingredients.include?(self.allergens)
        #   unsafe_recipes << recipe
        # else
        #   safe_recipes << recipe
        # end
        if (recipe.ingredients & self.allergens).empty?
          safe_recipes << recipe
        end
      end
    safe_recipes
  end



  def self.all
    @@all
  end
end
