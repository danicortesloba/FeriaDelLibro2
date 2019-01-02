json.extract! membership, :id, :name, :description, :price, :created_at, :updated_at
json.url membership_url(membership, format: :json)
