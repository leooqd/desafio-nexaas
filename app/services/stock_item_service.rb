module StockItemService
  def self.update(params)
    UpdateStock.run(params)
  end
end
