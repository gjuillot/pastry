Pastry::Application.routes.draw do  
  resources :ingredient_categories


  resources :recipe_ingredients


  resources :recipe_steps


  resources :recipes do
    member do
      post 'basic_insertion'
    end
  end


  resources :prices


  resources :ingredients


  devise_for :users

  root :to => "home#index"
end
