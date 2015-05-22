class PricesController < ApplicationController
  
  layout "admin"
  
  def index
    if (params[:ingredient].blank?)
      @prices = Price.all
    else
      @prices = Price.where("ingredient_id = ?", params[:ingredient])
    end
  end

  def show
    @price = Price.find(params[:id])
  end

  def new
    if (params[:ingredient].blank?)
      redirect_to ingredients_path
    else
      @price = Price.new
      @ingredient = Ingredient.find_by_id(params[:ingredient])
    end
  end

  def edit
    @price = Price.find(params[:id])
  end

  def create
    @price = Price.new(params[:price])
    if @price.save
      redirect_to @price.ingredient, notice: 'Price was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @price = Price.find(params[:id])

    if @price.update_attributes(params[:price])
      redirect_to @price, notice: 'Price was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @price = Price.find(params[:id])
    @price.destroy
    redirect_to @price.ingredient
  end
end
