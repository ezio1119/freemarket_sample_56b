class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  Payjp.api_key = Rails.application.credentials.payjp[:PRIVATE_KEY]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  
  has_one :address, dependent: :destroy
  has_many :cards, dependent: :destroy

  has_many :bought_orders, class_name: "Order", foreign_key: "bought_id"
  has_many :bought_items, through: :bought_orders, source: :item
  has_many :sold_orders, class_name: "Order", foreign_key: "sold_id"
  has_many :sold_items, through: :sold_orders, source: :item
  has_many :items, dependent: :destroy

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

  def self.from_omniauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.new(
      uid: auth.uid,
      provider: auth.provider,
      nickname: auth.info.name,
      email:    auth.info.email
      )
    end
    user
  end

  def cus_info
    Payjp::Customer.retrieve(payjp_cus)
  end

  def payment(amount)
    charge = Payjp::Charge.create(
      amount: amount,
      customer: payjp_cus,
      currency: 'jpy'
    )
    charge.id
  end
end