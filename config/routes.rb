Rails.application.routes.draw do
  devise_for :admins
  resources :instructors
  root 'requests#index'
end
