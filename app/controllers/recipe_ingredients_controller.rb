class RecipeIngredientsController < ApplicationController
  def index
    @recipe_ingredients = RecipeIngredient.all
  end

  def show
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def new
    if (params[:step_id].blank?)
      redirect_to recipes_path
    else
      @recipe_ingredient = RecipeIngredient.new
      @step = RecipeStep.find_by_id(params[:step_id])
      @step_number = params[:step]
    end
  end

  def edit
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def create
    @recipe_ingredient = RecipeIngredient.new(params[:recipe_ingredient])
    if @recipe_ingredient.save
      redirect_to @recipe_ingredient.recipe_step.recipe
    else
      render action: "new"
    end
  end

  def update
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    if @recipe_ingredient.update_attributes(params[:recipe_ingredient])
      redirect_to @recipe_ingredient.recipe_step.recipe
    else
      render action: "edit"
    end
  end

  def destroy
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @recipe_ingredient.destroy
    redirect_to @recipe_ingredient.recipe_step.recipe
  end
end
