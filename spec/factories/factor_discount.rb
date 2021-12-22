FactoryBot.define do
  factory :factor_discount do
    product { create(:product, name: 'Green Tea') }
    name { "CEO rule for tea" }
    min_products_number { 3 }
    max_products_number { nil }
    enabled { false }
    value { "0.66" }
  end
end
