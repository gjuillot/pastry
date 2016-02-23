class MacaronPrice < ActiveRecord::Base
  attr_accessible :text, :price
  
  default_scope order("price ASC")
end
