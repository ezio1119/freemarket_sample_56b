class UsersController < ApplicationController
  


  def index
  end

  def show
  end

  def profile
  end

  def logout
  end

  def identification
    @address = Address.new
  end

  def items_list 
    @items = current_user.items
  end

  def favorites_list
    @items = current_user.favorite_items
  end

end