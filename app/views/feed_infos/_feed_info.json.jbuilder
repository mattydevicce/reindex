json.extract! feed_info, :id, :feed_publisher_name, :feed_publisher_url, :feed_timezone, :feed_lang, :feed_version, :created_at, :updated_at
json.url feed_info_url(feed_info, format: :json)
