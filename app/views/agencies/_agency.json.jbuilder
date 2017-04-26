json.extract! agency, :id, :agency_name, :agency_url, :agency_timezone, :agency_lang, :agency_phone, :agency_id, :created_at, :updated_at
json.url agency_url(agency, format: :json)
