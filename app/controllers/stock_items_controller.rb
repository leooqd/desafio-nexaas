class StockItemsController < ApplicationController
  def update
    stock_item = StockItemService.update(stock_item_params)
    if stock_item.errors.blank?
      render json: stock_item, status: :ok
    else
      render json: stock_item.errors, status: :unprocessable_entity
    end
  end

  private

  def stock_item_params
    params.require(:stock_item).permit(
      :product_id,
      :store_id,
      :transaction,
      :quantity
    )
  end
end
