class CreateInvestmentCategories < ActiveRecord::Migration
  def change
    create_table :investment_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
