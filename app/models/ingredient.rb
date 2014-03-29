class Ingredient < ActiveRecord::Base
  attr_accessible :name, :unit
  
  UNITS = ["liquide (cl)", "au poids (g)", "unitaire"]
  
  def price
    Price.where("ingredient_id = ?", self.id).order("id DESC").first
  end
end
