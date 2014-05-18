class AddPublicInfoToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :sellable, :boolean
    add_column :recipes, :public_comment, :text
  end
end
