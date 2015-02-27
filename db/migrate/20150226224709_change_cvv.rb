class ChangeCvv < ActiveRecord::Migration
  def change
  	remove_column :users, :encrypted_cvv
  	add_column :users, :encrypted_cvv, :string
  end
end
