class Order < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :bought, class_name: 'User'
  belongs_to :sold, class_name: 'User'
  belongs_to :item

  validates :bought_id, presence: true
  validates :sold_id, presence: true
end