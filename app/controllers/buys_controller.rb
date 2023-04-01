class BuysController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @buy_shipping_address = BuyShippingAddress.new
  end
end
