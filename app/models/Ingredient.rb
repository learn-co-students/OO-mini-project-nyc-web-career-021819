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

  def self.most_common_allergen
    allergen_arr = []
    Allergen.all.each do |allergen|
      allergen_arr << allergen.ingredient
    end

    allergen_hash = {}
    allergen_arr.each do |allergen|
      if allergen_hash.has_key?(allergen.name)
        allergen_hash[allergen.name] += 1
      else
        allergen_hash[allergen.name] = 1
      end
    end
    most_popular = allergen_hash.sort_by do |allergen, count|
      count
    end.last.first

    allergen_arr.find do |allergen|
      allergen.name == most_popular
    end
  end

end
