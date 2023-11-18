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
class Cart < ApplicationRecord
  has_secure_token
	has_many :cart_items, dependent: :destroy

  def quantity
    cart_items.sum(&:quantity)
  end
end
