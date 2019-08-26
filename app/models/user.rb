class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include NameValidators
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

  has_many :comments, dependent: :destroy

  has_many :favorites
  has_many :favorite_items, through: :favorites, source: :item

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :cards
  
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :password, length: { minimum: 7 }
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

  def favorited_by?(item)
    favorites.where(item_id: item.id).exists?
  end
end