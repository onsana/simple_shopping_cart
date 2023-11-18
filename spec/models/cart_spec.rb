# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_carts_on_token  (token) UNIQUE
#
require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'validations' do
    it { should have_secure_token }
    it { should have_db_index(:token) }
  end

  describe 'associations' do
    it { should have_many(:cart_items) }
  end

  describe '#quantity' do
    let(:product_1) { FactoryBot.create(:product, name: "Shi") }
    let(:product_2) { FactoryBot.create(:product, name: "Chi") }
    let(:cart) { FactoryBot.create(:cart) }

    it 'returns the summary of items' do
      FactoryBot.create(:cart_item, product: product_1, cart: cart, quantity: 2)
      expect(cart.quantity).to eq(2)
    end
  end
end
