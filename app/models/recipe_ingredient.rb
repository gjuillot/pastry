class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe_step
  belongs_to :ingredient
  attr_accessible :quantity, :recipe_step_id, :ingredient_id
  
  validates :quantity, :numericality => { :greater_than => 0 }
  
  def has_cost?
    !ingredient.price.nil?
  end
  
  def cost
    if has_cost?
      {
        :cost => ingredient.price.price * quantity / ingredient.price.quantity,
        :place => ingredient.price.place,
        :date => ingredient.price.date
      }
    else
      {
        :cost => 0,
        :place => nil,
        :date => nil
      }
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
