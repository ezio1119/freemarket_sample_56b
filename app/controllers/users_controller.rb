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
    @items = Item.all
  end

end