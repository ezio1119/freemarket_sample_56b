crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :exhibit_items_now do
  link "出品した商品 - 出品中", items_list_user_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_user_path
  parent :mypage
end

crumb :card do
  link "支払い方法", users_cards_path
  parent :mypage
end

crumb :identification do 
  link "本人情報の登録", identification_user_path
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