class ItemsController < ApplicationController

  def index
  end
  

  def item_params
    params.require(:item).permit(:name, :explanation,:category_id,:situation_id,:price,:prefecture_id,:shipping_day_id,:delivery_charge_id, :image).merge(user_id: current_user.id)
  end
end
