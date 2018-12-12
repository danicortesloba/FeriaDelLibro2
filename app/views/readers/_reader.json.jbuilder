json.extract! reader, :id, :firstname, :lastname, :user_id, :created_at, :updated_at
json.url reader_url(reader, format: :json)
