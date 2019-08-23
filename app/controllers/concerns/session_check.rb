module SessionCheck
  extend ActiveSupport::Concern

  def session_exists?
    case params[:controller]
    when "users/phone_auth", "users/addresses"
      if not session[:user] && session[:pass] && session[:pass_conf]
        redirect_to users_index_path
      end
    when "users/cards"
      if not session[:user] && session[:pass] && session[:pass_conf] && session[:address]
        redirect_to users_index_path
      end
    when "users/registrations"
      if not session[:user] && session[:pass] && session[:pass_conf] && session[:address] && session[:payjp_cus] && session[:payjp_car]
        redirect_to users_index_path
      end
    end
  end
end