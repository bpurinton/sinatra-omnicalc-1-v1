class Recipe
  attr_accessor :title, :description, :ingredients, :method

  @@recipes = []
  @@id_counter = 0

  def initialize(attributes = {})
    @id = attributes[:id] || @@id_counter += 1
    @title = attributes[:title]
    @description = attributes[:description]
    @ingredients = attributes[:ingredients]
    @method = attributes[:method]
  end

  def self.all
    @@recipes
  end

  def self.find(id)
    @@recipes.find { |recipe| recipe.id == id }
  end

  def save
    @@recipes << self
  end
end
