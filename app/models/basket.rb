class Basket < ApplicationRecord
  STATES = %w[created cancelled sent]

  validates :client, presence: true
  validates :state,
            inclusion: { in: STATES }

  has_many :basket_items, dependent: :destroy

  before_save :set_subtotal

  def subtotal
    basket_items.sum do |item|
      item.unit_price * item.quantity
    end
  end
private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
