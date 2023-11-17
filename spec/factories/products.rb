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
#
FactoryBot.define do
  factory :product do
    name { "MyString" }
    product_code { "MyString" }
    price { "9.99" }
  end
end
