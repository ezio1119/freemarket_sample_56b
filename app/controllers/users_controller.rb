class UsersController < ApplicationController
  def show
  end

  def index
    binding.pry
  end

  def profile
  end

  def identification
    @address = Address.new
  end

end
