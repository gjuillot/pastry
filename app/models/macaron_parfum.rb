class MacaronParfum < ActiveRecord::Base
  attr_accessible :name, :macaron_category_id
  belongs_to :macaron_category
  
  default_scope order("macaron_category_id ASC, name ASC")
end
