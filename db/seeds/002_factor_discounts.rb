[
	{
    code: 'GR1',
    name: 'Green Tea',
    price: 3.11
  },
	{
    code: 'SR1',
    name: 'Strawberries',
    price: 5.00
  }
].each do |discount_hash|
  FactorDiscount.find_or_create_by(discount_hash)
end
