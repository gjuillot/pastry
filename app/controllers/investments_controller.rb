class InvestmentsController < ApplicationController
  def index
    @investments = Investment.all
    @users = User.all
  end

  def create
    @investment = Investment.new(params[:investment])
    @investment.user_id = current_user.id
    @investment.save
    redirect_to investments_path
  end
  
  def destroy
    @investment = Investment.find(params[:id])
    @investment.destroy
    redirect_to investments_path
  end

end
