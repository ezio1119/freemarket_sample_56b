class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production? 
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery except: :create

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :birth_date, :first_name_kana, :last_name_kana])
  end

  private
  def production?
    Rails.env.production?
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.basic[:BASIC_AUTH_USER] && password == Rails.application.credentials.basic[:BASIC_AUTH_PASSWORD]
    end
  end

end
