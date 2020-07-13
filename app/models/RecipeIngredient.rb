class RecipeIngredient

  attr_accessor :recipe
  attr_reader :ingredient
  @@all = []

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  #def ingredient

    #binding.pry
    #Ingredient.all.select do |ingredient|
      #ingredient.name
    #end
  #end

end
