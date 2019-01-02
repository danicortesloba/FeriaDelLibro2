json.extract! membership_order, :id, :membership_id, :user_id, :paid, :created_at, :updated_at
json.url membership_order_url(membership_order, format: :json)
