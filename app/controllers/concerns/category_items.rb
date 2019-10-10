module CategoryItems
  extend ActiveSupport::Concern
  
  btm_ids = [[*(160..339)], [*(340..470)], [*(471..586)], [*(587..714)], [*(715..765)], [*(766..866)], [*(867..954)], [*(955..1029)], [*(1030..1125)], [*(1126..1167)], [*(1168..1218)], [*(1219..1274)], [*(1275..1331)]]
  def category_items(category)
    if category.id <= 13
      ids = btm_ids[category.id - 1]
      items = Item.where(category_id: ids).order("created_at DESC")
      exit
    elsif category.id <= 159
      categories = [category.children].flatten.compact
    else
      categories = [category].flatten.compact
    end

    ids = categories.pluck(:id)
    items = Item.where(category_id: ids).order("created_at DESC")
  end
end