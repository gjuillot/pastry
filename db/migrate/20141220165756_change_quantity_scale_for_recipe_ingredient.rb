class ChangeQuantityScaleForRecipeIngredient < ActiveRecord::Migration
  def change
    change_column :recipe_ingredients, :quantity, :decimal, :precision => 10, :scale => 2
  end
end
