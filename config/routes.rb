Rails.application.routes.draw do
  resources :texts
  resources :feed_infos
  resources :agencies
  resources :stops
  resources :shapes
  resources :stop_times
  resources :calendar_dates
  resources :trips
  resources :routes
  get '/trips/:FromStop/:ToStop/:time', to: 'trips#custom'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
