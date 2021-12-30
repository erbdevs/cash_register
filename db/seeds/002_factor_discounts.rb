[
	{
    product: Product.find_by(code: 'GR1'),
    name: "CEO Green tea buy-one-get-one-free",
    min_products_number: 2,
    max_products_number: nil,
    enabled: true,
    value: 0.5
  },
	{
    product: Product.find_by(code: 'CF1'),
    name: "CEO Green tea buy-one-get-one-free",
    min_products_number: 3,
    max_products_number: nil,
    enabled: true,
    value: 2.0/3
  }
].each do |discount_hash|
  FactorDiscount.find_or_create_by(discount_hash)
end
