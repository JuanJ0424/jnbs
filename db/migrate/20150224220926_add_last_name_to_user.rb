class AddLastNameToUser < ActiveRecord::Migration
  def change
  	add_column :users, :encrypted_last_name, :string
  	# Also rename name to be encrypted
  	rename_column :users, :name, :encrypted_name
  end
end
