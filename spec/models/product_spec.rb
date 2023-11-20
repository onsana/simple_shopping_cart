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
require "rails_helper"

RSpec.describe Product, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:product_code) }
  end

  describe 'associations' do
    it { should have_many(:cart_items) }
    it { should belong_to(:discount).optional }
  end
end
