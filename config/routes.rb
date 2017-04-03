Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # Scopes the path to sign in and sign out a user from omniauth-facebook
  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  resources :activities do
      get 'map_location', on: :collection
  end
  root 'activities#index'

  resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # GET /apartments/:apartment_id/map_locations
  get '/all_markers' => 'activities#show_all_activities'
end
