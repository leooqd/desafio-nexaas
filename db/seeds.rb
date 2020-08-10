30.times do
  p = Product.create(name: Faker::Lorem.word, description: Faker::Lorem.paragraph, price: Faker::Number.decimal(l_digits: 2).to_d)
  s = Store.create(name: Faker::Lorem.word, address: Faker::Address.full_address)

  StockItem.create(product: p, store: s, quantity: Faker::Number.between(from: 1, to: 99))
end