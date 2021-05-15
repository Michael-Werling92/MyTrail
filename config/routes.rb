Rails.application.routes.draw do

  root "articles#index"

  get "/articles", to: "articles#index"

  get '/auth/:provider/callback', to: "sessions#omniauth"

  resources :scouts do
    resources :trips
    resources :scout_badges
  end

  resources :scout_badges
  resources :badges
  resources :trips


  get 'login', to: "sessions#new"

  post 'login', to: "sessions#create"

  delete 'logout', to: "sessions#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
