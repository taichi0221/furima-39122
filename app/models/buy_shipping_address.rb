class BuyShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id ,:post_code, :prefecture_id, :municipality, :address, :building, :tel_number, :buy_id

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, presence: true,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipality, presence: true
  validates :address, presence: true
  validates :tel_number, presence: true, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }


  def save
  
    buy = Buy.create(user_id: user_id,item_id: item_id)
  
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, tel_number: tel_number, buy_id: buy.id)
  end

end