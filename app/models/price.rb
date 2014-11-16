class Price < ActiveRecord::Base
  belongs_to :ingredient
  attr_accessible :ingredient_id, :place, :price, :quantity
  
  default_scope order("id DESC")
  
  validates :price, :numericality => { :greater_than => 0 }
  validates :quantity, :numericality => { :greater_than => 0 }
  
  def date
    created_at
  end
end
