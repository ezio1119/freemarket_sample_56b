module NameValidators
  extend ActiveSupport::Concern

  included do
    validates :first_name, presence: true, format: {
    with: /[^ -~｡-ﾟ]+/
    }
    validates :first_name_kana, presence: true, format: {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/
    }
    validates :last_name, presence: true, format: {
      with: /[^ -~｡-ﾟ]+/
    }
    validates :last_name_kana, presence: true, format: {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/
    }
  end
end