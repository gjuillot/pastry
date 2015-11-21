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
    if (!current_user.nil?)
      redirect_to admin_path()
    else
      render :layout => false
    end
  end
  
  def index
  end
  
  def produits
  end
  
  def entremets
  end
  
  def tartes
  end
  
  def macarons_geants
  end
  
  def macarons
  end
  
  def desserts_glaces
  end
  
  def cheese_cakes
  end
  
  def gateaux_decores
  end
  
  def autres_patisseries_americaines
  end
  
  def pour_vos_evenements
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
