module StockItemService
  class UpdateStock
    attr_reader :params, :errors, :stock_item

    ADD_TRANSACTION     = 'add'.freeze
    REMOVE_TRANSACTION  = 'remove'.freeze

    def initialize(params)
      @params = StockItemConverter.params_to_struct(params)
      @errors = {}
    end

    def self.run(params)
      new(params).run
    end

    def run
      fetch_stock_item
      update

      stock_item
    rescue StandardError => e
      Rails.logger.error e.message
    end

    private

    def fetch_stock_item
      @stock_item = StockItem.find_or_initialize_by(stock_item_attributes)
    end

    def stock_item_attributes
      {
        product_id: params.product_id,
        store_id: params.store_id
      }
    end

    def update
      stock_item.quantity = new_quantity
      stock_item.save
    end

    def new_quantity
      return quantity_with_aditional if add_transaction
      return quantity_with_subtraction if remove_transaction

      stock_item.quantity
    end

    def quantity_with_aditional
      stock_item.quantity + quantity
    end

    def quantity
      params.quantity.to_i.abs
    end

    def add_transaction
      params.transaction == ADD_TRANSACTION
    end

    def remove_transaction
      params.transaction == REMOVE_TRANSACTION
    end

    def quantity_with_subtraction
      new_amount = stock_item.quantity - quantity

      [new_amount, 0].max
    end
  end
end
