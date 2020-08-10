class StockItem < ApplicationRecord
  belongs_to :product
  belongs_to :store

  validates :product_id, uniqueness: { scope: %i[store_id] }

  validates_associated :product
  validates_associated :store

  validates_numericality_of :quantity, greater_than: 0
end
