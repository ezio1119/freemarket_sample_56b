module CategoryItems
  extend ActiveSupport::Concern

  def category_items(id)
    @category = Category.find(id)
    if params[:id].to_i <= 13
      @categories = [@category.children.map { |category| category.children }].flatten.compact
    elsif params[:id].to_i <= 159
      @categories = [@category.children].flatten.compact
    else
      @categories = [@category].flatten.compact
    end
    ids = []
    @categories.each do |category|
      ids << category.id
    end
    items = Item.where(category_id: ids).order("created_at DESC")
  end
end