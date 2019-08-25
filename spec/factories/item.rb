FactoryBot.define do
  factory :item do
    size_id                 {"1"}
    name                    {"テスト太郎"}
    state_id                {"1"}
    delivery_burden_id      {"1"}
    delivery_method_id      {"1"}
    prefecture_id           {"1"}
    day_id                  {"1"}
    price                   {"500"}
    info                    {"aaaaaaaaaa"}
    brand_id                {"1"}
    user
    category
    after(:build) do |item|
      item.images.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'soy.png')), filename: 'soy.png', content_type: 'image/png')
    end
  end
end
