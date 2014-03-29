class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.references :ingredient
      t.string :place
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
    add_index :prices, :ingredient_id
  end
end
