class CreateIcecreams < ActiveRecord::Migration
  def change
    create_table :icecreams do |t|
      t.string :flavor
      t.text :description
      t.float :price
      t.attachment :photo
      t.integer :stock

      t.timestamps null: false
    end
  end
end
