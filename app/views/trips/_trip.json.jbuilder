json.extract! trip, :id, :service_id, :route_id, :trip_id, :trip_headsign, :trip_short_name, :direction_id, :shape_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
