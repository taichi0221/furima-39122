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
    end
  end
end
