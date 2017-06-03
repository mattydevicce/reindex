Rails.application.routes.draw do
  get '/texts/translator', to: 'texts#translator'
  post '/texts/some', to: 'texts#some'
  get '/trips/:FromStop/:ToStop/:time', to: 'trips#custom'
  post '/texts/translate', to: 'texts#translate'
  get '/texts/upload', to: 'texts#upload'
  resources :texts
  resources :feed_infos
  resources :agencies
  resources :stops
  resources :shapes
  resources :stop_times
  resources :calendar_dates
  resources :trips
  resources :routes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
