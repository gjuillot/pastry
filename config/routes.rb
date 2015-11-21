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
  
  resources :macarons_geants
  resources :tartes
  resources :entremets
  resources :patisseries_americaines
  
  match '/index', :to => "home#index"
  match '/produits', :to => "home#produits"
  match '/macarons', :to => "home#macarons"
  match '/desserts_glaces', :to => "home#desserts_glaces"
  match '/gateaux_decores', :to => "home#gateaux_decores"
  match '/pour_vos_evenements', :to => "home#pour_vos_evenements"
  match '/evenements', :to => "home#evenements"
  match '/partenaires', :to => "home#partenaires"
  match '/contact', :to => "home#contact"
  match '/legal', :to => "home#legal"
  match '/admin', :to => "home#admin"
  root :to => "home#welcome"
end
