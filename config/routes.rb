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
  
  match '/index', :to => "home#index"
  match '/produits', :to => "home#produits"
  match '/evenements', :to => "home#evenements"
  match '/partenaires', :to => "home#partenaires"
  match '/contact', :to => "home#contact"
  match '/legal', :to => "home#legal"
  match '/admin', :to => "home#admin"
  root :to => "home#welcome"
end
