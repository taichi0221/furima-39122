require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'name,explanation,price,category_id,situation_id,prefecture_id,shipping_day_id,delivery_charge_id,imageが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
  end
end
