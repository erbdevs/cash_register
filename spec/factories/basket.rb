FactoryBot.define do
  factory :basket do
    client { 'Obi Wan' }
    state { 'created' }
    subtotal { 0 }
    total { 0 }
  end
end
