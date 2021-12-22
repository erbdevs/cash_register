class UnitaryPriceDiscount < PricingRule
  belongs_to :product

  validates :value, numericality: { greater_than_or_equal_to: 0 }
end
