class AdminController < ApplicationController
  
  layout "admin"
  
  def investments
    @investments = Investment.all
    @users = User.all
  end
  
  def macarons
  end
  
  def html_snippets
  end

end
