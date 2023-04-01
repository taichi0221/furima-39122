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
    end
  end
end
