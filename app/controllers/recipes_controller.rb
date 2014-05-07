class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @edit_mode = params[:edit_mode].blank? ? true : (params[:edit_mode] == "true")
    
    if (params[:quantity].blank?)
      @quantity = @recipe.quantity
      @ratio = 1
    else
      @quantity = params[:quantity]
      @ratio = @quantity.to_d / @recipe.quantity
    end
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
        if @recipe.base?
          RecipeStep.create({:recipe_id => @recipe.id, :name => @recipe.name, :description => "Ecrire la recette"})
        end
      
        redirect_to @recipe
    else
        render action: "new"
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(params[:recipe])
      redirect_to @recipe
    else
      render action: "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url
  end
  
  def basic_insertion
    @recipe = Recipe.find(params[:id])
    basic = Recipe.find_by_id(params[:basic])
    ratio = params[:quantity].to_d / basic.quantity
    basic.steps.each do |step|
      step_name = basic.steps.size == 1 ? basic.name : basic.name + " - " + step.name
      step.duplicate(@recipe, step_name, ratio)
    end
    redirect_to @recipe
  end
end
