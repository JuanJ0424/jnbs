json.array!(@sale_details) do |sale_detail|
  json.extract! sale_detail, :id, :quantity, :price, :subtotal, :icecream_id, :sale_id
  json.url sale_detail_url(sale_detail, format: :json)
end
