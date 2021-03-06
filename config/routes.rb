Pastry::Application.routes.draw do  

  devise_for :users

  # Admin pages
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
  
  # Admin for public
  resources :macaron_categories
  resources :macaron_parfums
  resources :macaron_prices
  resources :product_images
  resources :product_prices
  resources :html_snippets
  
  #Public
  resources :products do
    collection do
      get 'generate_tartes'
    end
  end
  resources :tartes, controller: 'products', type: 'Tarte'
  
  resources :macarons_geants
  resources :entremets
  resources :patisseries_americaines
  
  match '/index', :to => "home#index"
  match '/produits', :to => "home#produits"
  
  match '/macarons', :to => "home#macarons"
  match '/macarons2', :to => "home#macarons2"
  
  match '/desserts_glaces', :to => "home#desserts_glaces"
  match '/gateaux_decores', :to => "home#gateaux_decores"
  match '/pour_vos_evenements', :to => "home#pour_vos_evenements"
  match '/evenements', :to => "home#evenements"
  match '/partenaires', :to => "home#partenaires"
  match '/contact', :to => "home#contact"
  match '/legal', :to => "home#legal"
  
  match '/admin', :to => "home#admin"
  match '/admin/macarons', :to => "admin#macarons"
  match '/admin/html_snippets', :to => "admin#html_snippets"
  match '/admin/investments', :to => "admin#investments"
  match '/admin/products', :to => "admin#products"
  
  root :to => "home#index"
end
