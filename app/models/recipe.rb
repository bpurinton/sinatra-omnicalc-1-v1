class Recipe
  attr_accessor :id, :title, :description, :ingredients

  @@all = []
  @@id = 0

  def initialize(title, description, ingredients)
    @id = @@id += 1
    @title = title
    @description = description
    @ingredients = ingredients
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    @@all.find { |recipe| recipe.id == id }
  end

  def save
    @@all << self
  end

  def self.seed_data
    Recipe.new("Chicken Curry", "A spicy curry made with chicken and vegetables.", ["Chicken", "Potatoes", "Carrots", "Onions", "Garlic", "Ginger", "Tomatoes", "Coconut milk", "Curry powder", "Salt", "Pepper"])
    Recipe.new("Spaghetti Bolognese", "A classic Italian dish made with pasta and a rich meat sauce.", ["Ground beef", "Onions", "Garlic", "Carrots", "Celery", "Tomato paste", "Canned tomatoes", "Beef broth", "Red wine", "Spaghetti", "Parmesan cheese"])
  end
end
