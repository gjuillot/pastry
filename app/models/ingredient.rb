class Ingredient < ActiveRecord::Base
  attr_accessible :name, :unit
  
  UNITS = ["liquide (cl)", "au poids (g)", "unitaire"]
end
