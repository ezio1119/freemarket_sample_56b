FactoryBot.define do
  factory :item do
    size                    {"00"}
    name                    {"テスト太郎"}
    state_id                {"新品、未使用"}
    delivery_burden_id      {"送料込(出品者負担)"}
    delivery_method_id      {"クロネコヤマト"}
    prefecture_id           {"北海道"}
    day_id                  {"1~2日で発送"}
    price                   {"500"}
    info                    {"aaaaaaaaaa"}
  end
end
