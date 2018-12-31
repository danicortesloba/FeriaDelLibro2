json.extract! order, :id, :user_id, :book_id, :payed, :created_at, :updated_at
json.url order_url(order, format: :json)
