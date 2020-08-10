class StockItemConverter
  def self.params_to_struct(params)
    params = JSON.parse(params.to_json, object_class: OpenStruct)
  end
end