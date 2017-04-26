json.extract! text, :id, :title, :content, :description, :created_at, :updated_at
json.url text_url(text, format: :json)
