Rails.application.routes.draw do
  devise_for :people
  root to: "welcome#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
