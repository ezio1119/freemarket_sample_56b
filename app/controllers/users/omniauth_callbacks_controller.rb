class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      session[:uid] = session["devise.#{provider}_data"][:uid]
      session[:provider] = session["devise.#{provider}_data"][:provider]
      session[:email] = session["devise.#{provider}_data"][:info][:email]
      session[:nickname] = session["devise.#{provider}_data"][:info][:name]
      redirect_to new_user_registration_path
    end
  end

  def failure
    redirect_to root_path
  end

end
