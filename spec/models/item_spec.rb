require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'title、explanation、category_id、item_status_id、delivery_fee_id、prefecture_id、estimated_shipping_date_id、priceの値が存在すれば作成できる' do
        expect(@item).to be_valid
      end
      it 'priceが¥300以上であれば出品できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが¥9,999,999以下であれば出品できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが初期値「---」では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_status_idが初期値「---」では出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'delivery_fee_idが初期値「---」では出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'prefecture_idが初期値「---」では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'estimated_shipping_date_idが初期値「---」では出品できない' do
        @item.estimated_shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥299以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが¥10,000,000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角数値以外（全角数値）では出品できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
