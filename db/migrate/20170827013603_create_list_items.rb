class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.references :list, index: true, null: false, foreign_key: true
      t.string :markdown_text
      t.string :original_text, null: false
      t.timestamps null: true
    end
  end
end
