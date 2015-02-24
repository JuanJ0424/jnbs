class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.float :total
      t.string :encrypted_credit_card
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :sales, :users
  end
end
