class Item < ApplicationRecord
    has_many_attached :images, dependent: :destroy
    belongs_to :user
    belongs_to :category
    has_one :order
    has_many :comments, dependent: :destroy
    has_one :bought, through: :order, source: :bought
    has_one :sold, through: :order, source: :sold
    has_many :favorites
    has_many :favorite_users, through: :favorites, source: :user
  
    validates :name, length: { maximum: 40 }, presence: true
    validates :state_id, presence: true
    validates :delivery_burden_id, presence: true
    validates :delivery_method_id, presence: true
    validates :prefecture_id, presence: true
    validates :day_id, presence: true
    validates :info, length: { maximum: 1000 }, presence: true
    validates :price, numericality: {
        greater_than_or_equal_to: 300,
        less_than_or_equal_to: 9999999
    }
    validates :category_id, presence: true
    validates :images, presence: true
    validate :image_type
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :state
    belongs_to_active_hash :delivery_burden
    belongs_to_active_hash :delivery_method
    belongs_to_active_hash :day
    belongs_to_active_hash :brand, optional: true
    belongs_to_active_hash :size, optional: true

    def favorited_by?(user)
        favorites.find_by(user_id: user.id)
    end
    private
    def image_type
      if images.attached?
        self.images.each do |image|
          errors.add(:image, '拡張子がJPEGまたはPNGを挿入してください') if !image.content_type.in?(%('image/jpeg image/png'))
        end
      else
        errors.add(:image, '画像を挿入してください')
      end
    end


end
