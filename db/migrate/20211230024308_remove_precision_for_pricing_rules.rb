class RemovePrecisionForPricingRules < ActiveRecord::Migration[6.1]
  def change
    change_column :factor_discounts, :value, :decimal, precision: nil, scale: nil
  end
end
