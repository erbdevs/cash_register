FactoryBot.define do
  factory :unitary_price_discount do
    product { create(:product, name: 'Green Tea') }
    name { "Low unitary price for tea" }
    min_products_number { 3 }
    max_products_number { nil }
    enabled { false }
    value { 1.0 }
  end
end
