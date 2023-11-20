# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  name         :string
#  price        :decimal(8, 2)
#  product_code :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discount_id  :integer
#
class Product < ApplicationRecord
  # validations
  validates :product_code, :name, :price, presence: true
  # associations
  has_many :cart_items, dependent: :destroy
  belongs_to :discount, optional: true
end
