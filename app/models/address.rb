class Address < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :postcode, presence: true, format: {
    with: /\d{3}[-]\d{4}/,
    message: "正しい形式で入力してください"
  }

  validates :city, presence: true

  validates :phone_number, presence: true, format: {
    with: /(070|080|090)\d{4}\d{4}/,
    message: "正しい電話番号を入力してください"
  }

  validates :block, presence: true

  validates :first_name, presence: true, format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "Please enter only double-byte"
  }
  validates :first_name_kana, presence: true, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "Please enter only full-width katakana"
  }
  validates :last_name, presence: true, format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "Please enter only double-byte"
  }
  validates :last_name_kana, presence: true, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "Please enter only full-width katakana"
  }
end
