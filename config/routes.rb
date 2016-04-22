Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, only: :show

  devise_scope :user do
    root to: "welcome#index"
  end

  get "/geocoding", to: "welcome#geocoding", as: "geocoding"
end
