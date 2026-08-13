json.extract! event, :id, :title, :description, :recurring_rules, :created_at, :updated_at
json.url event_url(event, format: :json)
