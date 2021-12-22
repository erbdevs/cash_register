class Basket < ApplicationRecord
  STATES = %w[created cancelled sent]

  validates :client, presence: true
  validates :state,
            inclusion: { in: STATES }
end
