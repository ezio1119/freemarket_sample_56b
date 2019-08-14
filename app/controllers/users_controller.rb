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
end