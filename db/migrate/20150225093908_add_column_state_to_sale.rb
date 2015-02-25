class AddColumnStateToSale < ActiveRecord::Migration
  def change
  	add_column :sales, :state, :boolean
  end
end
