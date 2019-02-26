class RecipeCard
  @@all = []

  attr_accessor :rating, :user, :recipe
  attr_reader :date

  def initialize(date, rating, user, recipe)
    @date = date
    @rating = rating
    @user = user
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end

end
