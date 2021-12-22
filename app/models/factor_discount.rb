class FactorDiscount < PricingRule
  belongs_to :product

  validates :value, presence: true
end
