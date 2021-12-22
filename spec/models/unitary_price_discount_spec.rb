require 'rails_helper'

RSpec.describe FactorDiscount do
  let(:discount_rule) { build(:unitary_price_discount) }

  it 'is valid' do
    expect(discount_rule.valid?).to eq(true)
  end

  context "regarding products_number" do
    context "when MIN and MAX are equal" do
      it 'is valid' do
        discount_rule.min_products_number = 3
        discount_rule.max_products_number = 3

        expect(discount_rule.valid?).to eq(true)
      end
    end

    context "when there is only MAX" do
      it 'is valid' do
        discount_rule.min_products_number = nil
        discount_rule.max_products_number = 7

        expect(discount_rule.valid?).to eq(true)
      end
    end

    context "when there is only MIN" do
      it 'is valid' do
        discount_rule.min_products_number = 7
        discount_rule.max_products_number = nil

        expect(discount_rule.valid?).to eq(true)
      end
    end

    context "when MAX is less than MIN" do
      it 'is invalid' do
        discount_rule.min_products_number = 3
        discount_rule.max_products_number = 2

        expect(discount_rule.valid?).to eq(false)
        expect(discount_rule.errors.messages).to eq(
          { max_products_number: ["has to be greater than min"] }
        )
      end
    end

    context "when both are nil" do
      it 'is invalid' do
        discount_rule.min_products_number = nil
        discount_rule.max_products_number = nil

        expect(discount_rule.valid?).to eq(false)
        expect(discount_rule.errors.messages).to eq(
          { min_products_number: ["can't be nil if max_products_number also is nil"] }
        )
      end
    end
  end
end
