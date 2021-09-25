class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_status

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :estimated_shipping_date

  validates :title,                      presence: true
  validates :explanation,                presence: true
  validates :category_id,                numericality: { other_than: 1 ,message: "can't be blank" }
  validates :item_Status_id,             numericality: { other_than: 1 ,message: "can't be blank" }
  validates :delivery_fee_id,            numericality: { other_than: 1 ,message: "can't be blank" }
  validates :prefecture_id,              numericality: { other_than: 1 ,message: "can't be blank" }
  validates :estimated_shipping_date_id, numericality: { other_than: 1 ,message: "can't be blank" }
  validates :price,                      presence: true
  validates :image,                      presence: true
end
