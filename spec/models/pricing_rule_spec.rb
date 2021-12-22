require 'rails_helper'

RSpec.describe PricingRule do
  let(:pricing_rule) { build(:pricing_rule) }

  it 'is valid' do
    expect(pricing_rule.valid?).to eq(true)
  end

  it 'invalid if both types are set' do
    pricing_rule.unitary_absolute_price = 1
    pricing_rule.unitary_factor_price = 0.5

    expect(pricing_rule.valid?).to eq(false)
  end
end
