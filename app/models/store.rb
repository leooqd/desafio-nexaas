class Store < ApplicationRecord
  has_many :stock_items
  has_many :products, through: :stock_items

  validates_presence_of :name, :address
end
