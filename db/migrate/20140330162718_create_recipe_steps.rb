class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps do |t|
      t.references :recipe
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :recipe_steps, :recipe_id
  end
end
