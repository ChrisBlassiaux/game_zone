class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  
  include ApplicationHelper
  
  private 

  def is_admin?
    if current_user.is_admin === false
      redirect_to '/'
    end
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def  set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
      parsed_locale.to_sym :
      nil
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:identifiant, :avatar_id, :email, :password)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:identifiant, :first_name, :last_name, :city, :avatar_id, :email, :password, :current_password)}
  end
end
