class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.timestamps null: true
    end
  end
end
