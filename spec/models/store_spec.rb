require 'rails_helper'

RSpec.describe Store, type: :model do
  it 'is invalid if address is blank' do
    store = build(:store, address: '')

    expect(store).to_not be_valid
  end

  it 'is invalid if name is blank' do
    store = build(:store, name: '')

    expect(store).to_not be_valid
  end

  it 'is valid with name and address' do
    store = build(:store, name: 'lala', address: '282 Kevin Brook, Imogeneborough, CA 58517')

    expect(store).to be_valid
  end
end
