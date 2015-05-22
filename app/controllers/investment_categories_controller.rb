class InvestmentCategoriesController < ApplicationController
  
  layout "admin"
  
  def create
    @investment_category = InvestmentCategory.new(params[:investment_category])
    @investment_category.save
    redirect_to investments_path
  end
end
