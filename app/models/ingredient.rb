class Ingredient < ActiveRecord::Base
  attr_accessible :name, :unit
  has_many :prices
  
  default_scope order("name ASC")
  
  UNITS = ["cl", "g", "unitaire"]
  
  def price
    Price.where("ingredient_id = ?", self.id).first
  end
end
