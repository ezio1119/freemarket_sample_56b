FactoryBot.define do
  factory :item do
    size                    {"00"}
    name                    {"テスト太郎"}
    state_id                {"1"}
    delivery_burden_id      {"1"}
    delivery_method_id      {"1"}
    prefecture_id           {"1"}
    day_id                  {"1"}
    price                   {"500"}
    info                    {"aaaaaaaaaa"}
    user                
  end
end
