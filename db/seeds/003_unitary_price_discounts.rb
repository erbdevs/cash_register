[
	{
    product: Product.find_by(code: 'SR1'),
    name: "COO Strawberries 4.50 if more than 3",
    min_products_number: 3,
    max_products_number: nil,
    enabled: true,
    value: 4.5
  },
].each do |discount_hash|
  UnitaryPriceDiscount.find_or_create_by(discount_hash)
end
