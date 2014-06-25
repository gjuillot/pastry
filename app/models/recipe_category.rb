class RecipeCategory < ActiveRecord::Base
  attr_accessible :name, :basic
  has_many :recipes
end
