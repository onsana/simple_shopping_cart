# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_cart_items_on_cart_id     (cart_id)
#  index_cart_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (product_id => products.id)
#
class CartItem < ApplicationRecord
  # since we are using this: target: dom_id(self, "quantity")
  # below, we need to include this include
  include ActionView::RecordIdentifier

  belongs_to :cart
  belongs_to :product

  after_create_commit do
    update_item_count
    update_total_price
  end

  after_update_commit do
    update_item_count
    update_total_price
    broadcast_replace_to cart, target: dom_id(self, "quantity"), partial: "carts/item_quantity", locals: { cart_item: self }
  end

  after_destroy_commit do
    broadcast_remove_to cart
    update_item_count
    update_total_price
  end

  def total_price
    quantity.to_i * product.price.to_f
  end

  private

  def update_total_price
    broadcast_replace_to cart,
                         target: "total_price",
                         partial: "carts/total_price",
                         locals: { current_cart: cart }
  end

  def update_item_count
    broadcast_replace_to cart,
                         target: "cart_count",
                         partial: "carts/item_count",
                         locals: { count: cart.quantity }
  end
end