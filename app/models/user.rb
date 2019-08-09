class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :address, dependent: :destroy
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "全角のみで入力してください"
  }
  validates :first_name_ruby, presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :last_name, presence: true, format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "全角のみで入力してください"
  }
  validates :last_name_ruby, presence: true, format: {
    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }
  validates :birth_date, presence: true
    
end
