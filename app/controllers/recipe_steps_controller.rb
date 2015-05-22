class RecipeStepsController < ApplicationController
  
  layout "admin"

  def index
    @recipe_steps = RecipeStep.all
  end

  def show
    @recipe_step = RecipeStep.find(params[:id])
  end

  def new
    if (params[:recipe].blank?)
      redirect_to ingredients_path
    else
      @recipe_step = RecipeStep.new
      @recipe = Recipe.find_by_id(params[:recipe])
      @recipe_step.recipe = @recipe
    end
  end

  def edit
    @recipe_step = RecipeStep.find(params[:id])
  end

  def create
    @recipe_step = RecipeStep.new(params[:recipe_step])
    @recipe_step.save
    redirect_to edit_recipe_path(@recipe_step.recipe)
  end

  def update
    @recipe_step = RecipeStep.find(params[:id])
    @recipe_step.update_attributes(params[:recipe_step])
    redirect_to edit_recipe_path(@recipe_step.recipe)
  end

  def destroy
    @recipe_step = RecipeStep.find(params[:id])
    @recipe_step.destroy
    redirect_to edit_recipe_path(@recipe_step.recipe)
  end
end
