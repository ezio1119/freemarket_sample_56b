class Users::RegistrationsController < Devise::RegistrationsController
  include CheckPath

  def index
  end

  def new
    if session[:omni]
      @user = User.new(session[:omni])
    else
      @user = User.new
    end
  end

  def put_in
    before_path("GET", "users/registrations", "new")
    @user = User.new(user_params)

    if session[:omni]
      pass = Devise.friendly_token[0,20]
      @user.password = pass
      @user.password_confirmation = pass
      @user.uid = session[:omni]["uid"]
      @user.provider = session[:omni]["provider"]
    end

    if @user.valid? && verify_recaptcha
      session[:user] = @user
      session[:pass] = @user.password
      session[:pass_conf] = @user.password_confirmation
      redirect_to users_phone_auth_index_path
    else
      render 'new'
    end
  end

  def create
    before_path("POST", "users/cards", "register_create")
    user = User.new(build_user)
    if user.save
      session.clear
      sign_in(user)
    else
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :birth_date,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana
    )
  end

  def build_user
    session[:user].merge(
      password: session[:pass],
      password_confirmation: session[:pass_conf],
      payjp_cus: session[:payjp_cus],
      address_attributes: session[:address],
      cards_attributes: session[:payjp_car]
    )
  end
end