class ChangeQuantityScaleForRecipeIngredient < ActiveRecord::Migration
  def change
    change_column :recipe_ingredients, :quantity, :decimal, :scale => 2
  end
end
