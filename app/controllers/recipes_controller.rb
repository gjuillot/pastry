class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    
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
end
