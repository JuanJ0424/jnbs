class AdminIcecream < Upmin::Model
  attributes :flavor, :description, :price, :photo, :stock

  action :update_price


  def update_price(price)
    model.price = price
    model.save!
  end

end