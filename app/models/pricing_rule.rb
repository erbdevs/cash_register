class PricingRule < ApplicationRecord
  self.abstract_class = true

  belongs_to :product

  validates :name, presence: true
  validates :enabled, inclusion:{ in: [true, false] }

  validate :valid_range_of_products_number?

  def valid_range_of_products_number?
    if max_products_number.nil? && min_products_number.nil?
      errors.add(:min_products_number, "can't be nil if max_products_number also is nil")
      return
    end
    return true if max_products_number.nil? || min_products_number.nil?

    if max_products_number < min_products_number
      errors.add(:max_products_number, 'has to be greater than min')
    end

    true
  end
end
