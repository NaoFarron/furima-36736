require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buy_delivery = FactoryBot.build(:buy_delivery, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_delivery).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buy_delivery.building_name = ''
        expect(@buy_delivery).to be_valid
      end
      it 'post_codeは、3桁ハイフン4桁の半角数値のみ保存できること' do
        @buy_delivery.postal_code = '123-4567'
        expect(@buy_delivery).to be_valid
      end
      it 'telephone_numberは10桁以上11桁以下の半角数値のみ保存できること（10桁の場合）' do
        @buy_delivery.telephone_number = '0901234567'
        expect(@buy_delivery).to be_valid
      end
      it 'telephone_numberは10桁以上11桁以下の半角数値のみ保存できること（11桁の場合）' do
        @buy_delivery.telephone_number = '09012345678'
        expect(@buy_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @buy_delivery.token = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @buy_delivery.postal_code = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_delivery.postal_code = '1234567'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが"2桁"ハイフン4桁の半角数値だと保存できないこと' do
        @buy_delivery.postal_code = '12-3456'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが"4桁"ハイフン4桁の半角数値だと保存できないこと' do
        @buy_delivery.postal_code = '1234-5678'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが3桁ハイフン"3桁"の半角数値だと保存できないこと' do
        @buy_delivery.postal_code = '123-456'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが3桁ハイフン"5桁"の半角数値だと保存できないこと' do
        @buy_delivery.postal_code = '123-45678'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが3桁ハイフン4桁の"全角数値"だと保存できないこと' do
        @buy_delivery.postal_code = '１２３-４５６７'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @buy_delivery.prefecture_id = 1
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @buy_delivery.city = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @buy_delivery.address = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @buy_delivery.telephone_number = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁の半角数値だと保存できないこと' do
        @buy_delivery.telephone_number = '090123456'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが12桁の半角数値だと保存できないこと' do
        @buy_delivery.telephone_number = '090123456789'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが10桁以上11桁以下の"全角"数値だと保存できないこと' do
        @buy_delivery.telephone_number = '０９０１２３４５６７８'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが10桁以上11桁以下の半角数値&ハイフンありだと保存できないこと' do
        @buy_delivery.telephone_number = '090-1234-5678'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_delivery.user_id = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buy_delivery.item_id = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end