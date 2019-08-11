# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController


  before_action :set_user, only: [:tell]
  before_action :set_user_params, only: [:tell,:create]


  def index
    

  end

  def new
    super
  end

  def tell
    @user = User.new(user_params)
    if @user.valid? && verify_recaptcha
      add_user_session(@user)
    else
      render 'new'
    if @user.valid?
      session = user_params
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def address
    @user = User.new(session)
  end

  def card
  end

  def create
    if @user.valid? && verify_recaptcha
      super
    else
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :new }
    end
  end
    
  end



  protected

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :first_name, :last_name, :first_name_kana, :last_name_kana ,:birth_date)
  end

  def set_user
    @user = User.new
  end

  def set_user_params
    @user = User.new(user_params)
  end

  def add_user_session(user)
    session[:nickname] = user.nickname
    session[:email] = user.email
    session[:password] = user.password
    session[:password_confirmation] = user.password_confirmation
    session[:first_name] = user.first_name
    session[:last_name] = user.last_name
    session[:first_name_kana] = user.first_name_kana
    session[:birth_date] = user.birth_date
  end

  


#----------------------------------------------------------------------------
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

#----------------------------------------------------------------------------


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
