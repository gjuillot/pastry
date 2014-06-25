class PricesController < ApplicationController
  # GET /prices
  # GET /prices.json
  def index
    if (params[:ingredient].blank?)
      @prices = Price.all
    else
      @prices = Price.where("ingredient_id = ?", params[:ingredient])
    end
  end

  # GET /prices/1
  # GET /prices/1.json
  def show
    @price = Price.find(params[:id])
  end

  # GET /prices/new
  # GET /prices/new.json
  def new
    if (params[:ingredient].blank?)
      redirect_to ingredients_path
    else
      @price = Price.new
      @ingredient = Ingredient.find_by_id(params[:ingredient])
    end
  end

  # GET /prices/1/edit
  def edit
    @price = Price.find(params[:id])
  end

  # POST /prices
  # POST /prices.json
  def create
    @price = Price.new(params[:price])
    if @price.save
      redirect_to @price.ingredient, notice: 'Price was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /prices/1
  # PUT /prices/1.json
  def update
    @price = Price.find(params[:id])

    if @price.update_attributes(params[:price])
      redirect_to @price, notice: 'Price was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price = Price.find(params[:id])
    @price.destroy
    redirect_to @price.ingredient
  end
end
