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

  context "regarding products_number" do
    context "when MIN and MAX are equal" do
      it 'is valid' do
        pricing_rule.min_products_number = 3
        pricing_rule.max_products_number = 3

        expect(pricing_rule.valid?).to eq(true)
      end
    end

    context "when there is only MAX" do
      it 'is valid' do
        pricing_rule.min_products_number = nil
        pricing_rule.max_products_number = 7

        expect(pricing_rule.valid?).to eq(true)
      end
    end

    context "when there is only MIN" do
      it 'is valid' do
        pricing_rule.min_products_number = 7
        pricing_rule.max_products_number = nil

        expect(pricing_rule.valid?).to eq(true)
      end
    end

    context "when MAX is less than MIN" do
      it 'is invalid' do
        pricing_rule.min_products_number = 3
        pricing_rule.max_products_number = 2

        expect(pricing_rule.valid?).to eq(false)
        expect(pricing_rule.errors.messages).to eq(
          { max_products_number: ["has to be greater than min"] }
        )
      end
    end

    context "when both are nil" do
      it 'is invalid' do
        pricing_rule.min_products_number = nil
        pricing_rule.max_products_number = nil

        expect(pricing_rule.valid?).to eq(false)
        expect(pricing_rule.errors.messages).to eq(
          { min_products_number: ["can't be nil if max_products_number also is nil"] }
        )
      end
    end
  end
end
