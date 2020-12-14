class ApplicationController < ActionController::Base
  before_action :set_locale
  
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
end
