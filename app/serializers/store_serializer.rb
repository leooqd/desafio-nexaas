class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :address

  has_many :stock_items

  class StockItemSerializer < ActiveModel::Serializer
    attributes :product_id, :product_name, :product_description, :product_price, :quantity

    def product_name
      object.product.name
    end

    def product_description
      object.product.description
    end

    def product_price
      object.product.price
    end
  end
end
