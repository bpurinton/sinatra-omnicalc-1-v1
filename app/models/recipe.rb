class Recipe
  attr_accessor :title, :description, :ingredients

  @@all = []

  def initialize(title, description, ingredients)
    @title = title
    @description = description
    @ingredients = ingredients
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find(title)
    all.find { |recipe| recipe.title == title }
  end
end
