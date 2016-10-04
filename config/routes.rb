Rails.application.routes.draw do
  devise_for :admins
  resources :instructors do
    resources :requests, only: [:create, :new,]
  end
  resources :request, except: [:create, :new]
  root 'instructors#index'
end
