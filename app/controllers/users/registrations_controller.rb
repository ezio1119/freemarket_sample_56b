class Users::RegistrationsController < Devise::RegistrationsController

  def index
  end

  def new
    super
  end

  def tell
    
    @user = User.new(user_params)
    if @user.valid? && verify_recaptcha
      session[:user] = @user
      session[:pass] = @user.password
      session[:pass_conf] = @user.password_confirmation
    else
      render 'new'
    end
  end

  def create
    binding.pry
    user = User.new(build_user)
    if user.save
      session.clear
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
      cards_attributes: [{
        payjp_car: session[:payjp_car]
      }]
    )
  end
end