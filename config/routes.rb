Rails.application.routes.draw do
  resources :scout_badges
  resources :badges
  resources :trips
  resources :scouts do
    resources :trips
    resources :scout_badges
  end

  get 'login', to: "sessions#new"

  post 'login', to: "sessions#create"

  delete 'logout', to: "sessions#destroy"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
