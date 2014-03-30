class Recipe < ActiveRecord::Base
  attr_accessible :name, :quantity, :unit
  has_many :recipe_steps
  
  UNITS = ["personnes", "parts"]
  
  def steps
    recipe_steps
  end
  
  def cost
    steps.map(&:cost).inject(:+)
  end
end
