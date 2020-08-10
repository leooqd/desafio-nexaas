require 'rails_helper'

RSpec.describe 'StockItem', type: :request do
  describe 'POST /stock_items/update' do
    describe 'when it has valid parameters' do
      context 'creating with correct attributes' do
        let!(:product) { create(:product) }
        let!(:store) { create(:store) }

        let!(:stock_item_attributes) do
          {
            quantity: 10,
            product_id: product.id,
            store_id: store.id,
            transaction: 'add'
          }
        end

        it 'created with success' do
          post stock_items_update_path, params: { stock_item: stock_item_attributes }
          expect(StockItem.last).to have_attributes(stock_item_attributes.except(:transaction))
          expect(response).to have_http_status(200)
        end
      end

      context 'adding with correct attributes' do
        let!(:stock_item) { create(:stock_item, quantity: 10) }

        let!(:stock_item_attributes) do
          {
            quantity: 10,
            product_id: stock_item.product_id,
            store_id: stock_item.store_id,
            transaction: 'add'
          }
        end

        it 'updating with success' do
          post stock_items_update_path, params: { stock_item: stock_item_attributes }

          expect(StockItem.last.quantity).to eq(20)
          expect(response).to have_http_status(200)
        end
      end

      context 'removing with correct attributes' do
        let!(:stock_item) { create(:stock_item, quantity: 10) }

        let!(:stock_item_attributes) do
          {
            quantity: 7,
            product_id: stock_item.product_id,
            store_id: stock_item.store_id,
            transaction: 'remove'
          }
        end

        it 'updating with success' do
          post stock_items_update_path, params: { stock_item: stock_item_attributes }

          expect(StockItem.last.quantity).to eq(3)
          expect(response).to have_http_status(200)
        end
      end
    end

    describe 'when it has invalid parameters' do
      context 'creating with no product' do
        let!(:store) { create(:store) }

        let!(:stock_item_attributes) do
          {
            quantity: 10,
            product_id: nil,
            store_id: store.id,
            transaction: 'add'
          }
        end

        it 'should return 422 status code' do
          post stock_items_update_path, params: { stock_item: stock_item_attributes }
          expect(response).to have_http_status(422)
        end
      end

      context 'creating with no store' do
        let!(:product) { create(:product) }

        let!(:stock_item_attributes) do
          {
            quantity: 10,
            product_id: product.id,
            store_id: nil,
            transaction: 'add'
          }
        end

        it 'should return 422 status code' do
          post stock_items_update_path, params: { stock_item: stock_item_attributes }
          expect(response).to have_http_status(422)
        end
      end

      context 'when quantity is blank' do
        let!(:product) { create(:product) }
        let!(:store) { create(:store) }

        let!(:stock_item_attributes) do
          {
            quantity: nil,
            product_id: product.id,
            store_id: store.id,
            transaction: 'add'
          }
        end

        it 'should return 422 status code' do
          post stock_items_update_path, params: { stock_item: stock_item_attributes }
          expect(response).to have_http_status(422)
        end
      end
    end
  end
end
