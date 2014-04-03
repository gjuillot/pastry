class Recipe < ActiveRecord::Base
  attr_accessible :name, :quantity, :unit, :category
  has_many :recipe_steps
  
  UNITS = ["personnes", "parts", "g", "cl"]
  CATEGORIES = ["Base", "Entremet", "Autre"]
  
  def steps
    recipe_steps
  end
  
  def cost
    steps.map(&:cost).inject(0, :+)
  end
end
