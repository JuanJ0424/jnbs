class CreateSaleDetails < ActiveRecord::Migration
  def change
    create_table :sale_details do |t|
      t.integer :quantity
      t.float :price
      t.float :subtotal
      t.belongs_to :icecream, index: true
      t.belongs_to :sale, index: true

      t.timestamps null: false
    end
    add_foreign_key :sale_details, :icecreams
    add_foreign_key :sale_details, :sales
  end
end
