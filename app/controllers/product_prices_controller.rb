class ProductPricesController < ApplicationController
  
  def create
    @price = ProductPrice.new(params[:product_price])
    @price.save
    redirect_to @price.product
  end

  def destroy
    @price = ProductPrice.find(params[:id])
    @price.destroy
    redirect_to @price.product
  end
end
