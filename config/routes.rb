Rails.application.routes.draw do
  root 'instructors#index'
  devise_for :admins
  resources :instructors do
    post '/', to: "requests#create", as: "new_request" # create requests
  end

  get '/history', to: "requests#history", as: "history" # requests history
end
