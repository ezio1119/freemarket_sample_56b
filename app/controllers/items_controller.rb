class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :buy]
  before_action :authenticate_user!, only: [:buy, :new, :create]

  def index
    @items = Item.limit(8)
    @items = Item.where.not(user_id: current_user.id).limit(8) if user_signed_in?
  end

  def show
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
    redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end
  
  private
  def item_params
    params.require(:item).permit(
      :name,
      :state_id,
      :delivery_burden_id,
      :prefecture_id,
      :delivery_method_id,
      :day_id,
      :price,
      :info,
      :image,
      ).merge(
        user_id: current_user.id
      )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
