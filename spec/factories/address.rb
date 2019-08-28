FactoryBot.define do
  factory :address do
    postcode        {"150-0041"}
    prefecture_id   {2}
    city            {"渋谷区神南"}
    block           {"1丁目18-2"}
    building        {"フレーム神南坂ビル"}
    phone_number    {"08000000000"}
    last_name       {"田中"}
    first_name      {"太郎"}
    last_name_kana  {"タナカ"}
    first_name_kana {"タロウ"}

    trait :invalid do
      postcode {nil}
    end
  end
end