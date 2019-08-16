class Users::CardsController < ApplicationController
  Payjp.api_key = Rails.application.credentials.payjp[:PRIVATE_KEY]

  def register

  end

  def show
    # @card = current_user.card.card_info
  end

  def new
  end

  def create
    payjp_cus = Card.create_customer
    payjp_car = Card.create_card(payjp_cus, params[:payjp_token])
    session[:payjp_cus] = payjp_cus
    session[:payjp_car] = payjp_car
    render layout: false
  end

  # def destroy
  #   card = current_user.card
  #   if card.destroy_card
  #     card.card = nil
  #     redirect_to users_cards_path, alert: "削除に成功しました"
  #   else
  #     redirect_to users_cards_path, notice: "削除に失敗しました"
  #   end
  # end
end