class BasketItemPriceCalculator
  def initialize(basket_item)
    @basket_item = basket_item
    @product = basket_item.product
    # ToDo:
    # To see if we really need the posibility for having several
    # pricing rules for a product
    @pricing_rule = @product.pricing_rules.first
  end

  def run
    return product.price unless pricing_rule

    calculate_modified_price
  end

private

  attr_reader :basket_item, :product, :pricing_rule

  def calculate_modified_price
    return product.price unless quantity_in_valid_range?

    if pricing_rule.instance_of?(FactorDiscount)
      product.price * pricing_rule.value
    elsif pricing_rule.instance_of?(UnitaryPriceDiscount)
      pricing_rule.value
    end
  end

  def quantity_in_valid_range?
    basket_item.quantity.in?(
      pricing_rule.min_products_number..pricing_rule.max_products_number
    )
  end
end