class Allergen
  attr_accessor :ingredient, :user
  @@all = []

  def self.all
    @@all
  end

def initialize(ingredient, user)
  self.ingredient = ingredient
  self.user = user
  Allergen.all << self
end

end
