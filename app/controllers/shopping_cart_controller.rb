class ShoppingCartController < ApplicationController
	require 'json'
	def add_to_cart
		current_sale = current_user.sales.last
		icecream = Icecream.find(params[:id])
		if icecream.stock >= 1
			new_sale? = true
			# Create or get User's last sale

			if current_sale.nil? || current_sale.state
				current_sale = Sale.new
				current_sale.user = current_user
				current_sale.credit_card = current_user.credit_card
				current_sale.save
				new_sale? = false
			end
			
			# If it's not a new sale means that it could has SaleDetails
			if !new_sale?
				sd = current_sale.sale_details.find_or_create_by(icecream: icecream)
				if sd.quantity == 1 ? sd.quantity += 1 : sd.quantity = 1
				sd.price = sd.icecream.price
				sd.subtotal = sd.quantity * sd.price
			else
				sd = SaleDetail.new
				sd.icecream = icecream
				sd.price = sd.icecream.price
				sd.quantity = 1
				sd.subtotal = sd.price
			end

			if sd.save
				render json: sd
			else
				render json: {type: :error, :description => ":("}.to_json
			end

		else
			redirect_to root_path # No icecreams to add
		end
	end
end
