class SaleDetail < ActiveRecord::Base
  require 'json'
  belongs_to :icecream
  
  belongs_to :sale

  validates :quantity , numericality: {only_integer: true, greather_tan_or_equal_to: 1, less_than: 20}

  def set_subtotal
  	self.subtotal = self.icecream.price * self.quantity
  end
    
  def remove_item_from_cart current_user, icecream_id
    message = {}
    current_sale = current_user.sales.last
    sale_detail = current_sale.sale_details.find_by_icecream_id(icecream_id)
    if !sale_detail.nil?
        if sale_detail.quantity == 1
            sale_detail.destroy
        else
            sale_detail.quantity -= 1
            sale_detail.subtotal = sale_detail.price * sale_detail.quantity
            if sale_detail.save
                message[:state] = 200 
                message[:text] = "Ok, it's done"
            else
                message[:state] = 300
                message[:text] = "We couldn't remove your icecream from your shopping cart, you sure you didn't use glue?"
            end
        end
    else
        message[:state] = 301
        message[:text] = "dude, you don't even have that icecream in your cart"
    end 
    return message
  end
    
end
