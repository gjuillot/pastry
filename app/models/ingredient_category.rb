class IngredientCategory < ActiveRecord::Base
  attr_accessible :name
  
  default_scope order("name ASC")
  
  validates :name, length: { minimum: 2 }
end
