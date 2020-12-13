class ApplicationController < ActionController::Base
  
  
  private 

  def is_admin?
    if current_user.is_admin === false
      redirect_to '/'
    end
  end
end
