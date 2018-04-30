Rails.application.routes.draw do
  get 'subscribe', to: 'youtube_subscription#subscribe'
  get 'update', to: 'youtube_subscription#confirm'
  post 'update', to: 'youtube_feed#update'
end
