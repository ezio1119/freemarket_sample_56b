class Item < ApplicationRecord
    has_one_attached :image, dependent: :destroy
    belongs_to :user
    has_one :order
    has_one :bought, through: :order, source: :bought
    has_one :sold, through: :order, source: :sold

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

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :state
    belongs_to_active_hash :delivery_burden
    belongs_to_active_hash :delivery_method
    belongs_to_active_hash :day
end
