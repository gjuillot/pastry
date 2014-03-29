Pastry::Application.routes.draw do  
  resources :prices


  resources :ingredients


  devise_for :users

  root :to => "home#index"
end
