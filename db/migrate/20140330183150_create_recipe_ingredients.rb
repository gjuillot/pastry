class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe_step
      t.references :ingredient
      t.integer :quantity

      t.timestamps
    end
    add_index :recipe_ingredients, :recipe_step_id
    add_index :recipe_ingredients, :ingredient_id
  end
end
