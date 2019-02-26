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
  # def allergen_helper
  #   Allergen.all.select do |allergen|
  #     allergen.ingredient == self
  #   end
  # end
  #
  #
  # Ingredient.all.each do |ingredient|
  #   #[egg, nut, chocolate, walnuts]
  #   ingredient.allergen.count

  # def self.most_common_allergen
  #   # variable = Allergen.all.map do |allergen|
  #   #   allergen.ingredient.name
  # end

end
