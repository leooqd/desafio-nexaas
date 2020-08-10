class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price

  has_many :stock_items

  class StockItemSerializer < ActiveModel::Serializer
    attributes :store_id, :store_name, :store_address, :quantity

    def store_name
      object.store.name
    end

    def store_address
      object.store.address
    end
  end
end
