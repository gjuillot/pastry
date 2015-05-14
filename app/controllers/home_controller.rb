class HomeController < ApplicationController
  def index
    @recipes_by_category = {}
    RecipeCategory.all.each do |category|
      @recipes_by_category[category.name] = Recipe.sellables.where("recipe_category_id = ?", category.id).all
    end
    @recipes_by_category["Sans categorie"] = Recipe.sellables.where("recipe_category_id IS NULL").all
  end
  
  def welcome
    render :layout => false
  end
end
