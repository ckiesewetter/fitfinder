Rails.application.routes.draw do
  resources :activities do
      get 'map_location', on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'activities#index'
  # GET /apartments/:apartment_id/map_locations
  get '/all_markers' => 'activities#show_all_activities'
end
