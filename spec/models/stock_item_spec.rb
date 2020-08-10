require 'rails_helper'

RSpec.describe StockItem, type: :model do
  it 'is invalid without product' do
    stock_item = build(:stock_item, product: nil)

    expect(stock_item).to_not be_valid
  end

  it 'is invalid without store' do
    stock_item = build(:stock_item, store: nil)

    expect(stock_item).to_not be_valid
  end

  it 'is valid with product and store' do
    stock_item = build(:stock_item, product: create(:product), store: create(:store))

    expect(stock_item).to be_valid
  end
end
