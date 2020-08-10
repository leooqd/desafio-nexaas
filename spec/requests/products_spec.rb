require 'rails_helper'

RSpec.describe "Products", type: :request do

  describe "GET /products/:id" do
    context "when id is correct" do
      it "show name" do
        product = create(:product)
        get "/products/#{product.id}"

        expect(response.body).to include(product.name)
      end
      it "show description" do
        product = create(:product)
        get "/products/#{product.id}"

        expect(response.body).to include(product.description)
      end
      it "show price" do
        product = create(:product)
        get "/products/#{product.id}"

        expect(response.body).to include("#{product.price}")
      end
    end
  end

  describe "POST /products" do
    context "when it has valid parameters" do
      it "created the product with correct attributes" do
        product_attributes = FactoryBot.attributes_for(:product)
        post products_path, params: {product: product_attributes}
        expect(Product.last).to have_attributes(product_attributes)
      end
    end

    context "when it has no valid parameters" do
      it "doest not create product" do
        expect{
          post products_path, params: {product: {name: '', price: 0}}
        }.to_not change(Product, :count)
      end
    end
  end


  describe "PUT /products" do

    context "when the product exist" do
      let(:product) {create(:product)}
      let(:product_attributes) {{product: attributes_for(:product)}}
      before(:each) {put "/products/#{product.id}", params: product_attributes}

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns the product updated" do
        expect(product.reload).to have_attributes(json.except('created_at', 'updated_at', 'price'))
      end
    end

    context "when the product does not exist" do
      before(:each){put "/products/0", params: attributes_for(:product)} 

      it "return satus code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Product/)
      end
    end
  end

  describe "DELETE /products/:id" do
    it "delete the product with correct id" do
      product = create(:product)
        expect{
          delete "/products/#{product.id}"
        }.to change(Product, :count)

    end
  end

  def json
    JSON.parse(response.body)
  end

end
