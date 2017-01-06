Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'sessions#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: :post_login
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#index'

  resources :users, only: [:show, :new, :create, :index]

  resources :redlights

# exists but is commented out for easier debugging pre-deployment
  # get '*unmatched_route', to: 'application#raise_not_found'
end
