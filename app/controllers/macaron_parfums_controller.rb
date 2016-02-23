class MacaronParfumsController < ApplicationController
  
  layout "admin"
  
  def create
    @macaron_parfum = MacaronParfum.new(params[:macaron_parfum])
    @macaron_parfum.save
    redirect_to "/admin/macarons"
  end
  
  def destroy
    @macaron_parfum = MacaronParfum.find(params[:id])
    @macaron_parfum.destroy
    redirect_to "/admin/macarons"
  end
end
