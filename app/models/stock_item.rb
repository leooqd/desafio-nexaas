class StockItem < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates_associated :product
  validates_associated :store

  validates_numericality_of :quantity, greater_than: 0
end
