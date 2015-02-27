class ShoppingCartController < ApplicationController
    before_filter :authenticate_user!
    require 'json'
    def add_to_cart
        current_sale = (current_user.sales.last.nil? ? Sale.new : current_user.sales.last)
        puts current_sale.id
        icecream = Icecream.find(params[:id])
        if icecream.stock >= 1
            render json: current_sale.add_to_cart(icecream, current_user).to_json
        else
            render json: {type: "Error", description: "No hay más producto"}
        end
    end
    
    def remove_item_from_cart
        message = {}
        sale_detail = SaleDetail.new
        message = sale_detail.remove_item_from_cart current_user, params[:id]
        render json: message.to_json
    end 
    
    def get_current_cart
        _sale = current_user.sales.last
        
        if !_sale.nil?
            _saleDetails = _sale.sale_details
            saleDetails = []
        
            _saleDetails.each do |sd|
                template = {:flavor => "", :subtotal => 0, :quantity => 0}
                template[:flavor] = sd.icecream.flavor
                template[:id] = sd.icecream.id
                template[:quantity] = sd.quantity
                template[:subtotal] = sd.subtotal
                saleDetails.push template
                
            end
            render json: saleDetails.to_json
        else
            render text: ""
        end
        
        

    end

    def sale_test
        s = Sale.last
        render text: s.test_pa    
    end
    
    def finish_current_sale   
        current_sale = current_user.sales.last
        current_sale.set_total
        current_sale.state = true
        current_sale.save
        
        new_sale = Sale.new
        new_sale.user = current_user
        if new_sale.save
            render text: "Cachin!"
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
