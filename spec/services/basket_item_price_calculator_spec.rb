require "rails_helper"

RSpec.describe BasketItemPriceCalculator do
  let(:product) { create(:product, price: 1.89) }
  let(:basket_item) { create(:basket_item, quantity: quantity, product: product) }
  let(:quantity) { 1 }

  subject(:calculator) { described_class.new(basket_item) }

  context "when there is no PricingRule associated to product" do
    it "return product's price " do
      expect(calculator.run).to eq(product.price)
    end
  end

  context "when there is a FactorDisctount associated to product" do
    before do
      create(
        :factor_discount,
        product: product,
        name: "Half price if 3 or more",
        min_products_number: 3,
        enabled: true,
        value: 0.5
      )
    end

    context "but the amount is out of the range" do
      it "return product's price " do
        expect(calculator.run).to eq(product.price)
      end
    end

    context "and the amount is in the range" do
      let(:quantity) { 4 }

      it "return product's price " do
        expect(calculator.run).to eq(product.price/2)
      end
    end
  end

  context "when there is a UnitaryPriceDisctount associated to product" do
    before do
      create(
        :unitary_price_discount,
        product: product,
        name: "1€ if 3 or more",
        min_products_number: 3,
        enabled: true,
        value: 1.0
      )
    end

    context "but the amount is out of the range" do
      it "return product's price " do
        expect(calculator.run).to eq(product.price)
      end
    end

    context "and the amount is in the range" do
      let(:quantity) { 4 }

      it "return product's price " do
        expect(calculator.run).to eq(1.0)
      end
    end
  end
end