require 'rails_helper'

RSpec.describe Basket, type: :model do
  let(:basket) { build(:basket) }

  it 'is valid' do
    expect(basket.valid?).to eq(true)
  end

  context 'regarding the state' do
    it 'is invalid if the state is not in the list' do
      basket.state = 'wrong_state'

      expect(basket.valid?).to eq(false)
      expect(basket.errors.messages).to eq(
        { state: ["is not included in the list"] }
      )
    end
  end
end
