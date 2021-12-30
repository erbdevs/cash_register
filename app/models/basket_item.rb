class BasketItem < ApplicationRecord
  belongs_to :product
  belongs_to :basket

  before_save :set_unit_price
  before_save :set_total_price

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

private

  def set_unit_price
    self[:unit_price] = BasketItemPriceCalculator.new(self).run
  end

  def set_total_price
    self[:total_price] = self.unit_price * quantity
  end
end
