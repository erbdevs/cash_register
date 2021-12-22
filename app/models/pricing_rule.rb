class PricingRule < ApplicationRecord
  self.abstract_class = true

  belongs_to :product

  validates :name, :enabled, presence: true

  validate :valid_type_of_discount?, :valid_range_of_products_number?

  def valid_type_of_discount?
    if unitary_absolute_price.present? && unitary_factor_price.present?
      errors.add('only one can be defined')
    elsif unitary_absolute_price.nil? && unitary_factor_price.nil?
      errors.add('One of them must be defined')
    end

    true
  end

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
