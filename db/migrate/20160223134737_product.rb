class Product < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type
      t.string :name
      t.string :description
      t.string :allergenes
      t.boolean :published
    end
    
    create_table :product_prices do |t|
      t.references :product
      t.string :text
      t.decimal :price
    end
    
    create_table :product_images do |t|
      t.references :product
      t.string :url
      t.string :usage
    end
  end
end
