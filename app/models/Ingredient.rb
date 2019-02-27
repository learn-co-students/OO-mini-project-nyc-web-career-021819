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
  allergen_ingredients_array = Allergen.all.map do |allergen|
        allergen.ingredient
      end

  freq_hash = allergen_ingredients_array.inject(Hash.new(0)) {|h,k| h[k] += 1; h }

  allergen_ingredients_array.max_by{|k|freq_hash[k]}
 end

end
