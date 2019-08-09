class ItemsController < ApplicationController

    def index
      @items = Item.all
    end

    def show

    end
    
    def new
      @item = Item.new
    end

    def create
      binding.pry
      Item.create(item_params)
    end
    
    private

    def item_params
      params.require(:items).permit(:name, :delivery, :days, :price, :info)
    end

end
