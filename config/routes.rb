Pastry::Application.routes.draw do  
  
  devise_for :users

  resources :ingredients
  resources :ingredient_categories
  resources :prices

  resources :recipes do
    member do
      post 'basic_insertion'
    end
  end
  resources :recipe_categories
  resources :recipe_steps
  resources :recipe_ingredients
  
  resources :investments
  resources :investment_categories
  
  match '/admin', :to => "home#index"
  root :to => "home#welcome"
end
