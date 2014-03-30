class RecipeStep < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :description, :name, :recipe_id
  has_many :recipe_ingredients
  
  default_scope order("id ASC")
  
  def ingredients
    recipe_ingredients
  end
  
  def cost
    if ingredients.empty?
      0
    else
      ingredients.map(&:cost).inject(:+)
    end
  end
end
