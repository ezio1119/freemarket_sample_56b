FactoryBot.define do
  factory :user do
    nickname                {"テスト太郎"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    password                {"00000000"}
    password_confirmation   {"00000000"}
    first_name              {"田中"}
    last_name               {"太郎"}
    birth_date              {"2019-11-11"}
    first_name_kana         {"タナカ"}
    last_name_kana          {"タロウ"}
    trait :invalid do
      nickname {nil}
    end
  end
end