require 'rails_helper'

RSpec.describe 'Stores', type: :request do
  describe 'GET /stores/:id' do
    context 'when id is correct' do
      it 'show name' do
        store = create(:store)
        get "/stores/#{store.id}"

        expect(response.body).to include(store.name)
      end
      it 'show address' do
        store = create(:store)
        get "/stores/#{store.id}"

        expect(response.body).to include(store.address)
      end
    end
  end

  describe 'POST /stores' do
    context 'when it has valid parameters' do
      it 'created the store with correct attributes' do
        store_attributes = FactoryBot.attributes_for(:store)
        post stores_path, params: { store: store_attributes }
        expect(Store.last).to have_attributes(store_attributes)
      end
    end

    context 'when it has no valid parameters' do
      it 'doest not create store' do
        expect  do
          post stores_path, params: { store: { name: '', address: '' } }
        end.to_not change(Store, :count)
      end
    end
  end

  describe 'PUT /stores' do
    context 'when the store exist' do
      let(:store) { create(:store) }
      let(:store_attributes) { { store: attributes_for(:store) } }
      before(:each) { put "/stores/#{store.id}", params: store_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the store updated' do
        expect(store.reload).to have_attributes(json.except('created_at', 'updated_at'))
      end
    end

    context 'when the store does not exist' do
      before(:each) { put '/stores/0', params: attributes_for(:store) }

      it 'return satus code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Store/)
      end
    end
  end

  describe 'DELETE /stores/:id' do
    it 'delete the store with correct id' do
      store = create(:store)
      expect  do
        delete "/stores/#{store.id}"
      end.to change(Store, :count)
    end
  end
end
