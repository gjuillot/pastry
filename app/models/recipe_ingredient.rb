class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe_step
  belongs_to :ingredient
  attr_accessible :quantity, :recipe_step_id, :ingredient_id
  
  def has_cost?
    !ingredient.price.nil?
  end
  
  def cost
    if has_cost?
      ingredient.price.price * quantity / ingredient.price.quantity
    else
      0
    end
  end
end
