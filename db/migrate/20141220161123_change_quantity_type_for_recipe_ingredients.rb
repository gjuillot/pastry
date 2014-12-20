class ChangeQuantityTypeForRecipeIngredients < ActiveRecord::Migration
  def change
    change_column :recipe_ingredients, :quantity, :decimal
  end
end
