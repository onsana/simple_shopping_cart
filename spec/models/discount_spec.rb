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
require 'rails_helper'

RSpec.describe Discount, type: :model do
  it { should have_many(:products) }
end
