Rails.application.routes.draw do
  devise_for :users
  # devise_for :people
  root to: "welcome#index"
  resources :things
end
