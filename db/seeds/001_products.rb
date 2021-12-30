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
  },
	{
    code: 'CF1',
    name: 'Cofee',
    price: 11.23
  }
].each do |product_hash|
  Product.find_or_create_by(product_hash)
end