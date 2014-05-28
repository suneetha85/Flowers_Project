json.array!(@stores) do |store|
  json.extract! store, :id, :product_name, :product_type, :description, :price, :features
  json.url store_url(store, format: :json)
end
