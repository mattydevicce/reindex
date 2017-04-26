json.extract! route, :id, :route_id, :route_short_name, :route_long_name, :route_type, :route_color, :created_at, :updated_at
json.url route_url(route, format: :json)
