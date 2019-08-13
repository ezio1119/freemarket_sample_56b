class Users::RegistrationsController < Devise::RegistrationsController

  before_action :set_user_params, only: [:tell,:create]
  before_action :build_user_name, only: [:address]
  def index

  end

  def new
    super
  end

  def tell
    if @user.valid? && verify_recaptcha
      add_user_session(@user)
    else
      render 'new'
    end
  end

  def address
    @user.build_address
  end

  def card

  end

  def completion

  end

  def create
    if @user.valid? && verify_recaptcha
      super
    else
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :new }
    end
  end

  protected

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :first_name, :last_name, :first_name_kana, :last_name_kana ,:birth_date)
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
    session[:last_name_kana] = user.last_name_kana
    session[:birth_date] = user.birth_date
  end


  def build_user_name
    @user = User.new
    @user.first_name = session[:first_name]
    @user.last_name = session[:last_name]
    @user.first_name_kana = session[:first_name_kana]
    @user.last_name_kana = session[:last_name_kana]
  end


end