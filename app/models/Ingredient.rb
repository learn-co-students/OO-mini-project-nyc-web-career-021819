class Ingredient

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  # #HELPER
  def allergen_counter_helper
    Allergen.all.select do |allergen|
      allergen.ingredient == self
    end.length
  end

  def self.most_common_allergen
    Ingredient.all.sort_by do |ingredient|
      ingredient.allergen_counter_helper
    end.last
  end

end
