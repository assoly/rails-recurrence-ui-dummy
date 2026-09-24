json.extract! webinar, :id, :title, :description, :starts_at, :finishes_at, :time_zone_name, :schedule_json, :created_at, :updated_at
json.url webinar_url(webinar, format: :json)
