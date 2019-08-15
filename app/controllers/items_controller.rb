class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_items, only: [:show, :edit, :update, :destroy]
  
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

  def buy
    
  end   

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy!
      redirect_to items_list_users_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :size, :state_id, :delivery_burden_id, :prefecture_id,:delivery_method_id, :day_id, :price, :info, :image).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.with_attached_image.find(params[:id])
  end

end
