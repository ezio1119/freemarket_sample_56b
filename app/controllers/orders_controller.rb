class OrdersController < ApplicationController
  before_action :authenticate_user! 
  def index
    @address = current_user.address
    @card = current_user.card.card_info
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    charge = current_user.card.payment(params[:amount])
    item = Item.find(params[:item_id])
    order = Order.new(
      charge: charge,
      item_id: params[:item_id],
      sold_id: item.user_id,
      bought_id: current_user.id
    )
    if order.save
      redirect_to root_path
    else
      flash[:notice] = "購入に失敗しました"
      redirect_to root_path
    end
  end
end