crumb :root do
  link "メルカリ", root_path
end

crumb :item_show do |item|
  link "#{item.name}"
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

crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end
