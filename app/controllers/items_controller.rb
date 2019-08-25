class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_items, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.top_category
    binding.pry
    @ladys_items = @categories.items
  end

  def show
    @comment = Comment.new
  end
  
  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end
  
  def search
    @q = Item.ransack(search_params)
    @items = @q.result(distinct: true).page(params[:page]).per(20)
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
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :state_id, :delivery_burden_id, :prefecture_id,:delivery_method_id, :day_id, :price, :info, :category_id, :brand_id, :size_id, images:[]).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.with_attached_images.find(params[:id])
  end

  def search_params
    params.require(:q).permit!
  end
end

