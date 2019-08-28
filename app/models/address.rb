class Address < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  include NameValidators
  belongs_to :user
  belongs_to_active_hash :prefecture

  validates :city, presence: true
  validates :prefecture_id, presence: true
  validates :block, presence: true

  validates :postcode, presence: true, format: {
    with: /\d{3}[-]\d{4}/
  }
  validates :phone_number, presence: true, format: {
    with: /(070|080|090)\d{4}\d{4}/
  }
end
