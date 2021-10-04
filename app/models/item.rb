class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :estimated_shipping_date

  validates :title,                      presence: true
  validates :explanation,                presence: true
  validates :category_id,                numericality: { other_than: 1, message: "can't be blank" }
  validates :item_status_id,             numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_fee_id,            numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,              numericality: { other_than: 1, message: "can't be blank" }
  validates :estimated_shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, format: { with: /\A[0-9]+\z/, allow_blank: true }, inclusion: { in: 300..9_999_999, allow_blank: true },
                    presence: true
  validates :image, presence: true
end
