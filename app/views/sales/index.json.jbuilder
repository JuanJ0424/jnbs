json.array!(@sales) do |sale|
  json.extract! sale, :id, :total, :credit_card, :user_id
  json.url sale_url(sale, format: :json)
end
