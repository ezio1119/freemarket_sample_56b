class CategoriesController < ApplicationController
  include CategoryItems

  def search_children
    @categories = Category.where(parent_id: params[:select]).limit(18)
    respond_to do |format|
      format.json
    end
  end

  def index
  end
  
  def show
    items = category_items(params[:id])
    @items = Kaminari.paginate_array(items).page(params[:page]).per(1)
  end

end