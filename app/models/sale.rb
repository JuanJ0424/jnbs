class Sale < ActiveRecord::Base
  belongs_to :user
  has_many :sale_details

  # To set the total you must have a sale already saved,
  # then save its sale_details, an then and only then you may call "set_total"

  def set_total
  	total = 0
  	self.sale_details.each do |sd|
  		total += sd.subtotal
  	end
  	self.total = total
  	self.save
  end

  def set_credit_card
  	self.credit_cad = self.user.credit_cad.number
  end
end
