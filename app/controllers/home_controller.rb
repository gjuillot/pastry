class HomeController < ApplicationController
  def admin
    @recipes_by_category = {}
    RecipeCategory.all.each do |category|
      @recipes_by_category[category.name] = Recipe.sellables.where("recipe_category_id = ?", category.id).all
    end
    @recipes_by_category["Sans categorie"] = Recipe.sellables.where("recipe_category_id IS NULL").all
    render :layout => "admin"
  end
  
  def welcome
    render :layout => false
  end
  
  def index
  end
  
  def produits
  end
  
  def evenements
  end
  
  def partenaires
  end
  
  def contact
  end
  
  def legal
  end
end
