class UsersController < ApplicationController


  def index
  end

  def show
  end

  def profile
  end

  def identification
    @address = Address.new
  end

  def items_list 
    @user = User.find(current_user.id)
    @items = @user.items
  end

end