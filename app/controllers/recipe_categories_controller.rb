class RecipeCategoriesController < ApplicationController
  def create
    @recipe_category = RecipeCategory.new(params[:recipe_category])
    @recipe_category.save
    redirect_to recipes_path
  end
end
