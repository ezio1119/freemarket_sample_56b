class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
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
    @item = Item.with_attached_image.find(params[:id])
  end

  def update
    @item = Item.with_attached_image.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.with_attached_image.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy!
      redirect_to items_list_users_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :state_id, :delivery_burden_id, :prefecture_id,:delivery_method_id, :day_id, :price, :info, :image).merge(user_id: current_user.id)
  end
end
