json.extract! incident, :id, :location, :description, :measure, :created_at, :updated_at
json.url incident_url(incident, format: :json)
