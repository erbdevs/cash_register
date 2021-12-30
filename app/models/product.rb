class Product < ApplicationRecord
  validates :code, :name, :price, presence: true

  validates :name, length: { minimum: 3 }
  validates :code,
            length: { minimum: 3 },
            format: { with: /[A-Z]{2}\d{1}/, message: 'Invalid format for code' }

  has_many :basket_items

  def pricing_rules
    FactorDiscount.where(product: self, enabled: true) +
      UnitaryPriceDiscount.where(product: self, enabled: true)
  end
end
