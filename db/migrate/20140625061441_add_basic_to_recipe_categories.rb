class AddBasicToRecipeCategories < ActiveRecord::Migration
  def change
    add_column :recipe_categories, :basic, :boolean, default: false
  end
end
