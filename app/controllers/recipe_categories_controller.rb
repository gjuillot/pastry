class RecipeCategoriesController < ApplicationController
  def create
    @recipe_category = RecipeCategory.new(params[:recipe_category])
    @recipe_category.save
    redirect_to recipes_path
  end
  
  def show
    @recipe_category = RecipeCategory.find(params[:id])
  end
  
  def update
    @recipe_category = RecipeCategory.find(params[:id])
    @recipe_category.update_attributes(params[:recipe_category])
    redirect_to @recipe_category
  end
end
