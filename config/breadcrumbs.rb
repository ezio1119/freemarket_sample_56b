crumb :root do
  link "メルカリ", root_path
end

crumb :item_show do |item|
  link item.name
  parent :root
end

crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :exhibit_items_now do
  link "出品した商品 - 出品中"
  parent :mypage
end

crumb :favorite_lists do
  link "いいね！ 一覧"
  parent :mypage
end

crumb :profile do
  link "プロフィール"
  parent :mypage
end

crumb :card do
  link "支払い方法"
  parent :mypage
end

crumb :identification do 
  link "本人情報の登録"
  parent :mypage
end

crumb :logout do
  link "ログアウト"
  parent :mypage
end

crumb :bought do
  link "購入した商品-過去の取引", bought_orders_path
  parent :mypage
end

crumb :dealing do
  link "取引画面"
  parent :bought
end

crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :category do |category|
  link category.name, category_path(category)
  if category.parent
    parent category.parent
  else
    parent :categories
  end
end
