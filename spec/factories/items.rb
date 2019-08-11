FactoryBot.define do
  factory :item do
    size        {"00"}
    name        {"テスト太郎"}
    state       {"新品、未使用"}
    delivery    {"送料込(出品者負担)"}
    region      {"北海道"}
    days        {"1~2日で発送"}
    price       {"500"}
    info        {"aaaaaaaaaa"}
  end
end
