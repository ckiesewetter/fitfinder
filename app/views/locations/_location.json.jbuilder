json.extract! location, :id, :name, :adderss, :city, :state, :zip, :latitude, :longitude, :created_at, :updated_at
json.url location_url(location, format: :json)
