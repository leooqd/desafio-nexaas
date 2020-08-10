require 'rails_helper'

RSpec.describe Product, type: :model do

  it "is invalid if the price is not greater than 0" do
    product = build(:product, price: 0)

    expect(product).to_not be_valid
  end
end
