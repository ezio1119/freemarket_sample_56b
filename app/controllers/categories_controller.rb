class CategoriesController < ApplicationController
  def search_children
    @categories = Category.where(parent_id: params[:select]).limit(19)
    respond_to do |format|
      format.json
    end
  end

  def category_mach_size
    @category = Category.find(params[:select])
    if @category.parent.name == "靴"
      respond_to do |format|
        format.json
      end
    end
  end
end
