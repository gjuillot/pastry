class CreateRecipeCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.string :name
      t.timestamps
    end
    remove_column :recipes, :category
    add_column :recipes, :recipe_category_id, :integer
  end
end
