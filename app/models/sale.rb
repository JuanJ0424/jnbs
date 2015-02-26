class Sale < ActiveRecord::Base
  require 'json'
  belongs_to :user
  has_many :sale_details, dependent: :destroy

  attr_encryptor :credit_card, key: "dfsnkjiq3o4ytcioASDFASDFq345q2c424vbw4"

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
  	self.credit_card = self.user.credit_card
  end
  def test_pa
      return self.id
  end
    
  def add_to_cart icecream, current_user
    new_sale = false
    # Create or get User's last sale
    if self.id.nil? || self.state
      current_sale = Sale.new
      current_sale.user = current_user
      #self.set_credit_card
      current_sale.save
      new_sale = true
    end
      # If it's not a new sale means that it could has SaleDetails
    if !new_sale
      sale_detail = self.sale_details.find_or_create_by(icecream_id: icecream.id)
      sale_detail.quantity = (sale_detail.quantity == 0 ? 1 : sale_detail.quantity.to_i + 1)
      sale_detail.price = sale_detail.icecream.price
      sale_detail.subtotal = sale_detail.quantity * sale_detail.price
    else
      sale_detail = SaleDetail.new
      sale_detail.icecream = icecream
      sale_detail.price = sale_detail.icecream.price
      sale_detail.quantity = 1
      sale_detail.sale = current_sale
      sale_detail.subtotal = sale_detail.price
    end
    if sale_detail.save
      state = sale_detail.to_json
    else
      state = {type: :error, :description => ":("}.to_json
    end    
    return state
  end
    
end
