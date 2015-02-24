json.array!(@icecreams) do |icecream|
  json.extract! icecream, :id, :flavor, :description, :price, :photo
  json.url icecream_url(icecream, format: :json)
end
