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
FactoryBot.define do
  factory :cart do
    token { "MyString" }
  end
end
