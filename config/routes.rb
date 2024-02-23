Rails.application.routes.draw do
  resources :incomes
  resources :daily_costs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "daily_costs#new"
end
