class Users::AddressesController < ApplicationController

  def index

    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.valid?
    if @address.errors.keys.count == 1
      session[:address] = @address
      redirect_to register_users_cards_path
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
