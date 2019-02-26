
class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    self.name = name
    Ingredient.all << self
  end

  def self.all
    @@all
  end

  def recipes_with_ingredient
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.ingredient == self
    end 
  end


  def allergens
     Allergen.all.select {|allergen| allergen.ingredient == self}
  end

  def self.most_common_allergen
    allergen_count = {}
    Allergen.all.each do |allergen|
      allergen_count[allergen.ingredient] ||= 1
      allergen_count[allergen.ingredient] += 1
    end
    allergen_count.max_by {|allergen, count| count}[0]
  end

end
