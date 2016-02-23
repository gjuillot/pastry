class MacaronDyn < ActiveRecord::Migration
  def change
    create_table :macaron_categories do |t|
      t.string :name
    end
    
    create_table :macaron_parfums do |t|
      t.string :name
      t.references :macaron_category
    end
    
    create_table :macaron_prices do |t|
      t.string :text
      t.decimal :price
    end
  end
end
