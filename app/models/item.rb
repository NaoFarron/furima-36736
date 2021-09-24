class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title,                      presence: true
  validates :explanation,                presence: true
  validates :category_id,                presence: true
  validates :item_Status_id,             presence: true
  validates :delivery_fee_id,            presence: true
  validates :prefecture_id,              presence: true
  validates :estimated_shipping_date_id, presence: true
  validates :price,                      presence: true
  validates :image,                      presence: true
end
