class Users::AddressesController < ApplicationController
  include CheckPath

  def index
    before_path("POST", "users/phone_auth", "send_sms")
    @address = Address.new
  end

  def create
    before_path("GET", "users/addresses", "index")
    @address = Address.new(address_params)
    @address.valid?
    if @address.errors.keys.count == 1
      session[:address] = @address
      redirect_to register_users_cards_path, data: {"turbolinks" => false}
    else
      render 'index'
    end
  end

  private
  def address_params
    params.require(:address).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :postcode,
      :prefecture_id,
      :city,
      :block,
      :building,
      :phone_number
    )
  end
end
