class Users::CardsController < ApplicationController
  Payjp.api_key = Rails.application.credentials.payjp[:PRIVATE_KEY]
  before_action :set_card, only: [:destroy, :change]
  before_action :authenticate_user!, except: [:register, :register_create]
  include CheckPath

  def index
    @cards = current_user.cards
    if @cards.present?
      cus_info = current_user.cus_info
      @default = cus_info.default_card
    end
  end

  def register
    before_path("GET", "users/addresses", "index")
  end

  def register_create
    before_path("GET", "users/cards", "register")
    payjp_cus = Card.create_customer
    payjp_token = Card.create_token(payjp_params.to_hash)
    payjp_car = Card.create_card(payjp_cus, payjp_token)

    session[:payjp_car] = [{
        payjp_car: payjp_car
    }]
    session[:payjp_cus] = payjp_cus
    render layout: false
  end

  def new
  end

  def create
    payjp_token = Card.create_token(payjp_params.to_hash)
    payjp_car = Card.create_card(current_user.payjp_cus, payjp_token)
    card = current_user.cards.new( payjp_car: payjp_car )

    if card.save
      redirect_to users_cards_path, alert: "カードを登録しました"
    else
      redirect_to users_cards_path, notice: "カードの登録に失敗しました"
    end
  end

  def change
    @card.change_def(current_user)
    redirect_to users_cards_path, alert: "デフォルトカードに設定しました"
  end

  def destroy
    @card.destroy_card(current_user)
    @card.destroy
    redirect_to users_cards_path, alert: "削除しました"
  end

  private
  def set_card
    @card = Card.find(params[:id])
  end

  def payjp_params
    params.permit(
      :number,
      :cvc,
      :exp_month,
      :exp_year,
    )
  end
end