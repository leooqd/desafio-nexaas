class Product < ApplicationRecord
  has_many :stock_items
  has_many :stores, through: :stock_items

  validates_presence_of :name
  validates_numericality_of :price, greater_than: 0
end
