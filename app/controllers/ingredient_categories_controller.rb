class IngredientCategoriesController < ApplicationController
  
  layout "admin"
  
  def create
    @ingredient_category = IngredientCategory.new(params[:ingredient_category])
    @ingredient_category.save
    redirect_to ingredients_path
  end
end
