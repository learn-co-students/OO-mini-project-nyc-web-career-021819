class Ingredient
  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    ingredient_array =
    Allergen.all.map do |allergy|
      allergy.ingredient
    end
    ingredient_array.group_by{|i| i.name}.values.max_by(&:size).first
  end
end
