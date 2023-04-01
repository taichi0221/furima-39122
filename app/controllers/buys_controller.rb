class BuysController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @buy_shipping_address = BuyShippingAddress.new
  end

  def create
    @buy_shipping_address = BuyShippingAddress.new(buy_params)
    if @buy_shipping_address.valid?
      @buy_shipping_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buy_params
    params.require(:buy_shipping_address).permit(:post_code, :prefecture_id, :municipality, :address, :building, :tel_number)merge(item_id: item_id, user_id: current_user.id)

end
