class CategoriesController < ApplicationController
  def search_children
    @categories = Category.where(parent_id: params[:select]).limit(19)
    respond_to do |format|
      format.json
    end
  end
end
