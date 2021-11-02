json.extract! event, :id, :name, :date, :location, :points, :confirmation_code, :created_at, :updated_at
json.url event_url(event, format: :json)
