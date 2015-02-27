class AdminSale < Upmin::Model
  attributes :total, :client_name, :encrypted_credit_card, :state

  def client_name
    unless model.user = nil
      "#{model.user.name} #{model.user.last_name}"
    else
      "Este usuario ha eliminado su cuenta"
    end
  end

  action :set_total

  def set_total
  	total = 0
  	model.sale_details.each do |sd|
  		total += sd.subtotal
  	end
  	model.total = total
  	model.save
  end

end