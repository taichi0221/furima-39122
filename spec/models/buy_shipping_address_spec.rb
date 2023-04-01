require 'rails_helper'

RSpec.describe BuyShippingAddress, type: :model do
  before do
    @buy_shipping_address = FactoryBot.build(:buy_shipping_address)
  end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it 'post_code, prefecture_id, municipality, address, building, tel_numberが存在し,buy_idが空ならば保存できる' do
        expect(@buy_shipping_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @buy_shipping_address.building = ''
        expect(@buy_shipping_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_codeが空だと保存できない' do
        @buy_shipping_address.post_code = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが空だと保存できない' do
        @buy_shipping_address.prefecture_id = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できない' do
        @buy_shipping_address.municipality = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できない' do
        @buy_shipping_address.address = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_numberが空だと保存できない' do
        @buy_shipping_address.tel_number = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'user_idが空だと保存できない' do
        @buy_shipping_address.user_id = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @buy_shipping_address.item_id = ''
        @buy_shipping_address.valid?
        expect(@buy_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'buy_idが存在すると保存できない' do
        @buy_shipping_address.item_id = '1'
        @buy_shipping_address.valid?
    
        expect(@buy_shipping_address.errors.full_messages).to include("")
      end

    end
  end
end
