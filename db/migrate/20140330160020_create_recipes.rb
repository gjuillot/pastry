class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :quantity
      t.string :unit

      t.timestamps
    end
  end
end
