class CategoriesController < ApplicationController
  include CategoryItems
  before_action :set_category, only: :show

  def search_children
    @categories = Category.where(parent_id: params[:select]).limit(18)
    respond_to do |format|
      format.json
    end
  end

  def index
  end
  
  def show
    items = category_items(@category)
    @items = Kaminari.paginate_array(items).page(params[:page]).per(1)
  end
  private
  def set_category
    @category = Category.find(params[:id])
  end
end