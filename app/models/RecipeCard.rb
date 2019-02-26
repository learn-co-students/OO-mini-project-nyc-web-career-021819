class RecipeCard

  attr_accessor :recipe, :user, :date, :rating
  @@all = []

  def initialize(recipe, user, date, rating)
    @recipe = recipe
    @user = user
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end

  # def date1
  #    variable = RecipeCard.all.select do |recipecard|
  #     recipecard == self
  #   end
  #     variable.map do |recipecard|
  #     recipecard.date
  #   end
  # end

end
