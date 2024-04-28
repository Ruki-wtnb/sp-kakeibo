Rails.application.routes.draw do
  get 'home/index'
  resources :incomes
  resources :daily_costs
  resources :fixed_costs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
