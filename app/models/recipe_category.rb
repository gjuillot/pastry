class RecipeCategory < ActiveRecord::Base
  attr_accessible :name, :basic
  has_many :recipes
  
  scope :basics, where('basic = ?', true)
  scope :unbasics, where('basic = ?', false)
end
