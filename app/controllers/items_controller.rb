class ItemsController < ApplicationController

    def index
      @items = Item.all
    end

    def show
      
    end
    
    def new
    end
    
end
