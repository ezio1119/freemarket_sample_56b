class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :params_order, only: :create
  before_action :set_order, only: :show

  def index
  end

  def show
    @item = @order.item
    @address = current_user.address
    @sellar = User.find(@order.sold_id)
  end

  def new
    @address = current_user.address
    @item = Item.find(params[:item_id])

    if id = params[:card]
      card = Card.find(id)
      card.change_def(current_user)
    end

    if current_user.cards
      cus_info = current_user.cus_info
      default = cus_info.default_card
      card = Card.find_by(payjp_car: default)
      @card_info = card.disp_car_info(current_user)
    end
  end

  def create
    charge = current_user.payment(params_order[:amount])
    item = Item.find(params[:item_id])
    @order = Order.new(
      charge: charge,
      item_id: params[:item_id],
      sold_id: item.user_id,
      bought_id: current_user.id
    )
    if @order.save
    else
      redirect_to item_path(params[:item_id]), notice: "購入に失敗しました"
    end
  end

  def change
    @cards = current_user.cards
  end

  def bought
    @items = current_user.bought_items
  end

  def sold
  end

  private
  def params_order
    params.permit(:item_id, :amount)
  end
  def set_order
    @order = Order.find(params[:id])
  end
end