class MacaronPricesController < ApplicationController
  
  layout "admin"
  
  def create
    @macaron_price = MacaronPrice.new(params[:macaron_price])
    @macaron_price.save
    redirect_to "/admin/macarons"
  end
  
  def destroy
    @macaron_price = MacaronPrice.find(params[:id])
    @macaron_price.destroy
    redirect_to "/admin/macarons"
  end
end
