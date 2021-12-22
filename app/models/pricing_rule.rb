class PricingRule < ApplicationRecord
  belongs_to :product

  validates :name, :enabled, presence: true

  validate :valid_type_of_discount?

  def valid_type_of_discount?
    if unitary_absolute_price.present? && unitary_factor_price.present?
      errors.add('Only one can be defined')
    elsif unitary_absolute_price.nil? && unitary_factor_price.nil?
      errors.add('One of them must be defined')
    end
  end
end
