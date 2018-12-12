json.extract! book, :id, :title, :author_first_name, :author_last_name, :publisher_id, :cover, :price, :isbn, :synopsis, :created_at, :updated_at
json.url book_url(book, format: :json)
