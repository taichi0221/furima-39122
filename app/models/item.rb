class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :situation
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :delivery_charge
  has_one_attached :image

  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}

end
