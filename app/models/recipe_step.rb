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
  
  def duplicate(recipe, new_step_name, ratio)
    new_recipe_step = RecipeStep.create!(
      :name => new_step_name,
      :description => self.description,
      :recipe_id => recipe.id
    )
    self.ingredients.each do |ingredient|
      ingredient.duplicate(new_recipe_step, ratio)
    end
  end
end
