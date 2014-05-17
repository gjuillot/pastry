class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :name
      t.references :investment_category
      t.references :user
      t.decimal :price
      t.text :comment

      t.timestamps
    end
    add_index :investments, :investment_category_id
    add_index :investments, :user_id
  end
end
