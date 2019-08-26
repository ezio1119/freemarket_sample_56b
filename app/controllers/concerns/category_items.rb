module CategoryItems
  extend ActiveSupport::Concern

  def category_items(category)
    if category.id <= 13
      categories = [category.children.map { |category| category.children }].flatten.compact
    elsif category.id <= 159
      categories = [category.children].flatten.compact
    else
      categories = [category].flatten.compact
    end
    ids = categories.pluck(:id)
    items = Item.where(category_id: ids).order("created_at DESC")
  end
end