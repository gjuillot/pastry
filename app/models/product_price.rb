class ProductPrice < ActiveRecord::Base
  attr_accessible :product_id, :text, :price
  belongs_to :product
  
  default_scope order("price ASC")
end
