class AddCreditCardToUser < ActiveRecord::Migration
  def change
  	add_column :users, :encrypted_credit_card, :string
  	add_column :users, :encrypted_cvv, :integer
  end
end
