FactoryBot.define do
  factory :buy_delivery do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
  end
end
