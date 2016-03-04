class AdminController < ApplicationController
  
  layout "admin"
  
  def investments
    @investments = Investment.all
    @users = User.all
  end
  
  def macarons
    if (current_user.nil? or current_user.id != 1)
      redirect_to @@forbidden
      return
    end
  end
  
  def products
    if (current_user.nil? or current_user.id != 1)
      redirect_to @@forbidden
      return
    end
  end
  
  def html_snippets
    if (current_user.nil? or current_user.id != 1)
      redirect_to @@forbidden
      return
    end
  end

end
