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
    @categories = [
      # 下記で@categoryを取得
      @category,
      # 下記で@categoryの子カテゴリーを全て取得
      @category.children,
      # 下記で@categoryの子カテゴリーの子カテゴリーを全て取得
      @category.children.map { |category| category.children }
    ].flatten.compact
  end

end
