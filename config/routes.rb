Rails.application.routes.draw do
  root 'instructors#index'
  devise_for :admins
  resources :instructors do
    post '/', to: "requests#create", as: "new_request"
  end
end
