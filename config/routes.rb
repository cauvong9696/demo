Rails.application.routes.draw do
  resources :user
  get 'posts/index'
end
