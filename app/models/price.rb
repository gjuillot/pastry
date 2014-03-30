class Price < ActiveRecord::Base
  belongs_to :ingredient
  attr_accessible :ingredient_id, :place, :price, :quantity
  
  default_scope order("id DESC")
  
  def date
    created_at
  end
end
