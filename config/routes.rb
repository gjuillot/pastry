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
  match '/entremets', :to => "home#entremets"
  match '/tartes', :to => "home#tartes"
  match '/macarons_geants', :to => "home#macarons_geants"
  match '/macarons', :to => "home#macarons"
  match '/cheese_cakes', :to => "home#cheese_cakes"
  match '/gateaux_decores', :to => "home#gateaux_decores"
  match '/autres_patisseries_americaines', :to => "home#autres_patisseries_americaines"
  match '/pour_vos_evenements', :to => "home#pour_vos_evenements"
  match '/evenements', :to => "home#evenements"
  match '/partenaires', :to => "home#partenaires"
  match '/contact', :to => "home#contact"
  match '/legal', :to => "home#legal"
  match '/admin', :to => "home#admin"
  root :to => "home#welcome"
end
