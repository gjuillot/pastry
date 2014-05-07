class Ingredient < ActiveRecord::Base
  attr_accessible :name, :unit, :ingredient_category_id
  belongs_to :ingredient_category
  has_many :prices
  
  default_scope order("name ASC")
  
  UNITS = ["cl", "g", "unitaire"]
  
  def price
    Price.where("ingredient_id = ?", self.id).first
  end
  
  def category
    ingredient_category.name rescue "Sans categorie"
  end
  
  def to_s
    "#{name} (#{unit})"
  end
end
