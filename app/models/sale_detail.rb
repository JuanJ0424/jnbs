class SaleDetail < ActiveRecord::Base
  belongs_to :icecream
  
  belongs_to :sale

  validates :quantity , numericality: {only_integer: true, greather_tan_or_equal_to: 1, less_than: 20}

  def set_subtotal
  	self.subtotal = self.icecream.price * self.quantity
  end
end
