class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, dependent: :destroy
  has_many :cards, dependent: :destroy

  has_many :bought_lists, class_name: "Order", foreign_key: "bought_id"
  has_many :bought_items, through: :bought_lists, source: :item
  has_many :sold_lists, class_name: "Order", foreign_key: "sold_id"
  has_many :sold_items, through: :sold_lists, source: :sold

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :cards


  validates :nickname, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "Please enter only double-byte"
  }
  validates :first_name_kana, presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "Please enter only full-width katakana"
  }
  validates :last_name, presence: true, format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "Please enter only double-byte"
  }
  validates :last_name_kana, presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "Please enter only full-width katakana"
  }
  validates :birth_date, presence: true

end
