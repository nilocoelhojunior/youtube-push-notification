Rails.application.routes.draw do
  root 'welcomes#index'
  resources :youtube_feed
end
