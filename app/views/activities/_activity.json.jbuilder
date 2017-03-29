json.extract! activity, :id, :name, :user_id, :website, :description, :next_at, :location_id, :schedule, :created_at, :updated_at
json.url activity_url(activity, format: :json)
