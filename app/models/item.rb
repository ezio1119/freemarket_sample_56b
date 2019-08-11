class Item < ApplicationRecord
    has_many_attached :images, dependent: :destroy

    validates :name, length: { maximum: 40 }, presence: true
    validates :state, presence: true
    validates :delivery, presence: true
    validates :region, presence: true
    validates :days, presence: true
    validates :info, length: { maximum: 1000 }, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9999999 }

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
end
