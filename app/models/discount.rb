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
class Discount < ApplicationRecord
  has_many :products
end
