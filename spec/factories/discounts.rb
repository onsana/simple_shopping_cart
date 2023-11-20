# == Schema Information
#
# Table name: discounts
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  rule_params :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :discount do
    name { "zero_discount" }
    description { "MyString" }
    rule_params { "" }
  end
end
