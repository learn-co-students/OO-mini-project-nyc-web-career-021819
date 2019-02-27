class RecipeCard

  attr_accessor :date, :user, :recipe
  attr_reader :rating

  @@all = []

  def initialize(date, rating, user, recipe)
    @date = date
    if rating > 5
      @rating = 5
    elsif rating < 0
      @rating = 0
    else @rating = rating
    end
    @user = user
    @recipe = recipe
    @@all << self
  end


  def self.all
    @@all
  end


end
