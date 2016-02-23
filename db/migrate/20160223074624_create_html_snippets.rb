class CreateHtmlSnippets < ActiveRecord::Migration
  def change
    create_table :html_snippets do |t|
      t.string :location
      t.text :html
    end
  end
end
