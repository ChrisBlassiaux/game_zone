class ApplicationController < ActionController::Base
  # protect_from_forgery

  # helper_method :current_user, :signed_in?, :is_admin?

  # # to access the user object if it exists (if no user is logged in, "current_user" will be nil)
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  # # to check if a user is signed in
  # def signed_in?
  #   !!current_user
  # end

  # # to check if the current user is an admin
  # def is_admin?
  #   signed_in? ? current_user.admin : false
  # end
end
