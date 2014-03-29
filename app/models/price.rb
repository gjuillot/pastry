class Price < ActiveRecord::Base
  belongs_to :ingredient
  attr_accessible :ingredient_id, :place, :price, :quantity
end
