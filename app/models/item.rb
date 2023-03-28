class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :situation
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :delivery_charge
  has_one_attached :image


end
