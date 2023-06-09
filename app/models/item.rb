class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :situation
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :delivery_charge
  has_one_attached :image
  has_one :buy

  validates :category_id, presence: true,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, presence: true,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true,     numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_day_id, presence: true,   numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, presence: true,numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: { message: "can't be blank" }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is not a valid price" }
  validates :name, presence: true 
  validates :explanation , presence: true
  validates :image, presence: true
end
