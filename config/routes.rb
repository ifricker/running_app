 Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users, only: :show do
    resources :routes
  end

  # resources :routes, only: [:index, :new, :create]

  resources :waypoint, only: :create


  post 'anon_routes', to: 'anon_routes#create', defaults: { format: 'json' }


  devise_scope :user do
    root to: "welcome#index"
  end

  get "/geocoding", to: "welcome#geocoding", as: "geocoding"

  get "/about_us", to: "welcome#about", as: "about"

end
