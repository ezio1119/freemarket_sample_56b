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

    def item_params
      params.require(:item).permit(:name, :state_id, :delivery_burden_id, :prefecture_id,:delivery_method_id, :day_id, :price, :info, :image)
    end
    
end
