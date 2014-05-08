class Recipe < ActiveRecord::Base
  attr_accessible :name, :quantity, :unit, :recipe_category_id
  belongs_to :recipe_category
  has_many :recipe_steps
  
  scope :basics, where("recipe_category_id == 1")
  
  UNITS = ["personnes", "parts", "g", "cl"]
  
  def category
    recipe_category.name rescue "Sans categorie"
  end
  
  def steps
    recipe_steps
  end
  
  def cost
    steps.map(&:cost).inject(0, :+)
  end
  
  def base?
    recipe_category_id == 1
  end
end
