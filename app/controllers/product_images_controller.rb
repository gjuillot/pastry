class ProductImagesController < ApplicationController
  
  layout "admin"
  
  def create
    @product_image = ProductImage.new(params[:product_image])
    @product_image.save
    redirect_to @product_image.product
  end
  
  def destroy
    @product_image = ProductImage.find(params[:id])
    @product_image.destroy
    redirect_to @product_image.product
  end
end
