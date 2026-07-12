json.extract! item, :id, :title, :description, :item_image_path, :artist, :price, :quantity, :created_at, :updated_at
json.url item_url(item, format: :json)
