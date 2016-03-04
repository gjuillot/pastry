class ProductImage < ActiveRecord::Base
  attr_accessible :product_id, :url, :usage
  belongs_to :product
end
