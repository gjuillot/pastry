class MacaronCategoriesController < ApplicationController
  
  layout "admin"
  
  def create
    @macaron_category = MacaronCategory.new(params[:macaron_category])
    @macaron_category.save
    redirect_to "/admin/macarons"
  end
end
