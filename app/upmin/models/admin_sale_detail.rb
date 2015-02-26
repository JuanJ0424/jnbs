class AdminSaleDetail < Upmin::Model
  attributes :icecream_name, :icecream_id, :quantity, :price, :subtotal, :sale_id


  def icecream_name
  	model.icecream.flavor
  end

  action :set_subtotal

  #Upmin was supposed to use the model's method, but it did not
  def set_subtotal
  	model.subtotal = model.icecream.price * model.quantity
    model.save
  end

end