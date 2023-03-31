class BuyShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id ,:post_code, :prefecture_id, :municipality, :address, :building, :tel_number, :buy_id
end