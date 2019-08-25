class CategoriesController < ApplicationController
  def search_children
    @categories = Category.where(parent_id: params[:select]).limit(18)
    respond_to do |format|
      format.json
    end
  end

  def index
  end
  
  def show
    @category = Category.find(params[:id])
    if params[:id].to_i <= 13
      @categories = [@category.children.map { |category| category.children }].flatten.compact
    elsif params[:id].to_i <= 159
      @categories = [@category.children].flatten.compact
    else
      @categories = [@category].flatten.compact
    end

    items = []
    @categories.each do |category|
      category.items.each do |item|
        items << item
      end
    end
    @items = Kaminari.paginate_array(items).page(params[:page]).per(125)
  end

end