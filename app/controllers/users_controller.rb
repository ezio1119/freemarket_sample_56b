class UsersController < ApplicationController
  def show

  end

  def profile
  end

  def identification
    @address = Address.new
  end
end