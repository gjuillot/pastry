Pastry::Application.routes.draw do  
  resources :recipe_ingredients


  resources :recipe_steps


  resources :recipes


  resources :prices


  resources :ingredients


  devise_for :users

  root :to => "home#index"
end
