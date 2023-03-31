class BuyShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id ,:post_code, :prefecture_id, :municipality, :address, :building, :tel_number, :buy_id

  with_options presence: true do
    validates :postal_code, presence: true,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipality, presence: true,
    validates :address, presence: true,
    validates :building
    validates :tel_number, presence: true, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }
    

end