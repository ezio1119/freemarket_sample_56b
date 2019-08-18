class SizesController < ApplicationController
  def shoes_size
    @size = Size.shoes_size
    respond_to do |format|
      format.json
    end
  end

  def clothes_size
    @size = Size.clothes_size
    respond_to do |format|
      format.json
    end
  end
end

