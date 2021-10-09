FactoryBot.define do
  factory :item do
    title                      { 'タイトル' }
    explanation                { Faker::Lorem.sentence }
    category_id                { 2 }
    item_status_id             { 2 }
    delivery_fee_id            { 2 }
    prefecture_id              { 2 }
    estimated_shipping_date_id { 2 }
    price                      { 300 }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
