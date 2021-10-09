class BuyDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンを入れて入力して下さい", allow_blank: true}
    validates :city             
    validates :address          
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, allow_blank: true}
    validates :user_id          
    validates :item_id          
  end

  validates :prefecture_id,              numericality: { other_than: 1, message: "を入力してください" }


  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
  end
end