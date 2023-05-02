class Task
  attr_accessor :title, :description

  @@all = []

  def initialize(title, description)
    @title = title
    @description = description
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find(title)
    all.find { |task| task.title == title }
  end

end
