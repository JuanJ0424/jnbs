class ShoppingCartController < ApplicationController
    require 'json'
    def add_to_cart
        current_sale = current_user.sales.last
        icecream = Icecream.find(params[:id])
        if icecream.stock >= 1
            new_sale = false
            # Create or get User's last sale

            if current_sale.nil? #|| current_sale.state
                current_sale = Sale.new
                current_sale.user = current_user
                #current_sale.set_credit_card
                current_sale.save
                new_sale = true
                puts "\n\n\n NOT A NEW SALE \n\n\n"
            end
            
            # If it's not a new sale means that it could has SaleDetails
            if !new_sale
                puts "\n\n\n It's on da if\n\n\n"
                sale_detail = current_sale.sale_details.find_by_icecream_id(params[:id])
                sale_detail.quantity = (sale_detail.quantity == 1 ? sale_detail.quantity += 1 : sale_detail.quantity = 1)
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
                render json: sale_detail
            else
                render json: {type: :error, :description => ":("}.to_json
            end

        else
            redirect_to root_path # No icecreams to add
        end
    end
    
    def get_current_cart
        saleDetails = current_user.sales.last.sale_details
        
        render json: @current_sale = saleDetails.to_json
    end
    
    def finish_current_sale        
        new_sale = Sale.new
        new_sale.user = current_user
        if new_sale.save
            render text: "Done"
        else
            render text: "Failed"
        end
    end
    
    def drop_current_shopping_cart
        current_sale = current_user.sales.last
        sale_details = current_sale.sale_details
        
        sale_details.each do |_sd|
            _sd.destroy
        end
        
        render text: "Done"
    end
    
end
