Rails.application.routes.draw do
  devise_for :admins
  resources :instructors
  resources :requests, only: [:index]
  get '/', to: 'requests#index'
end
