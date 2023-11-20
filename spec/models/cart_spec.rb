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
    let(:discount) { FactoryBot.create(:discount) }
    let(:product_1) { FactoryBot.create(:product, name: "Shi", discount:) }
    let(:product_2) { FactoryBot.create(:product, name: "Chi") }
    let(:cart) { FactoryBot.create(:cart) }

    it 'returns the summary of items' do
      FactoryBot.create(:cart_item, product: product_1, cart: cart, quantity: 2)
      expect(cart.quantity).to eq(2)
    end
  end

  describe '#total_price' do
    it 'returns the total price for GR1,GR1' do
      product = Product.find_by_product_code('GR1')
      cart = FactoryBot.create(:cart)
      FactoryBot.create(:cart_item, product: product, cart: cart, quantity: 2)
      expect(cart.cart_items.sum(&:total_price)).to eq(3.11)
    end

    it 'returns the total price for SR1,SR1,GR1,SR1' do
      product_1 = Product.find_by_product_code('GR1')
      product_2 = Product.find_by_product_code('SR1')
      cart = FactoryBot.create(:cart)
      FactoryBot.create(:cart_item, product: product_1, cart: cart)
      FactoryBot.create(:cart_item, product: product_2, cart: cart, quantity: 3)
      cart_items = CartItem.where(cart_id: cart.id)
      expect(cart_items.sum(&:total_price)).to eq(16.61)
    end

    it 'returns the total price for GR1,CF1,SR1,CF1,CF1' do
      product_1 = Product.find_by_product_code('GR1')
      product_2 = Product.find_by_product_code('SR1')
      product_3 = Product.find_by_product_code('CF1')
      cart = FactoryBot.create(:cart)
      FactoryBot.create(:cart_item, product: product_1, cart: cart, quantity: 1)
      FactoryBot.create(:cart_item, product: product_2, cart: cart, quantity: 1)
      FactoryBot.create(:cart_item, product: product_3, cart: cart, quantity: 3)
      cart_items = CartItem.where(cart_id: cart.id)
      expect(cart_items.sum(&:total_price)).to eq(30.57)
    end
  end
end
