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

  def recipes
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end

  def add_recipe_card(date, rating, recipe)
    RecipeCard.new(date, rating, self, recipe)
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient, self)
  end

  def allergens
    Allergen.all.select do |allergy|
      allergy.user == self
    end
  end

  def top_three_recipes
    sorted_recipe_cards =
    recipes.sort_by do |recipe_card|
      recipe_card.rating
    end
    top_three = sorted_recipe_cards.last(3)
    top_three.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def most_recent_recipe
    recipes.last.recipe
  end

  def safe_recipes
    allergic_ingreidents =
    allergens.map do |allergen|
      allergen.ingredient
    end

    all_recipes = Recipe.all
    solution = []
    allergic_ingreidents.each do |ingredient|
      all_recipes.each do |recipe|
        unless recipe.ingredients.include?(ingredient)
          solution << recipe
        end
      end
    end
    solution
  end


end
