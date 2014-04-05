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
  
  def duplicate(new_step, ratio)
    RecipeIngredient.create(
      :quantity => self.quantity * ratio,
      :recipe_step_id => new_step.id,
      :ingredient_id => self.ingredient_id
    )
  end
end
