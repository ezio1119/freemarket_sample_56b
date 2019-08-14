class Users::RegistrationsController < Devise::RegistrationsController

  before_action :set_user_params, only: [:tell,:create]
  before_action :make_user, only: [:address]
  before_action :make_address, only: [:create]

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
    super
    binding.pry
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    @address.save
    binding.pry
    #next
    9011076249 is out of range for ActiveModel::Type::Integer with limit 4 bytes
  end

  protected

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :first_name, :last_name, :first_name_kana, :last_name_kana ,:birth_date)
  end

  def address_params
    params.require(:user)[:address].permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
  end

  def set_user_params
    @user = User.new(user_params)
  end
  
  def add_user_session(user)
    session[:nickname] = user.nickname
    session[:email] = user.email
    session[:password] = user.password
    session[:password_confirmation] = user.password_confirmation
    session[:birth_date] = user.birth_date
    session[:first_name] = user.first_name
    session[:last_name] = user.last_name
    session[:first_name_kana] = user.first_name_kana
    session[:last_name_kana] = user.last_name_kana
  end

  def make_user
    @user = User.new
    @user.nickname = session[:nickname]
    @user.email = session[:email]
    @user.password = session[:password]
    @user.password_confirmation = session[:password_confirmation]
    @user.birth_date = session[:birth_date]
    @user.first_name = session[:first_name]
    @user.last_name = session[:last_name]
    @user.first_name_kana = session[:first_name_kana]
    @user.last_name_kana = session[:last_name_kana]
  end


  def make_address
    @address = Address.new(address_params)
  end

end