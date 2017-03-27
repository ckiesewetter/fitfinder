json.extract! activity, :id, :title, :description, :time, :date, :location_name, :address, :city, :state, :zip, :latitude, :longitude, :created_at, :updated_at
json.url activity_url(activity, format: :json)
