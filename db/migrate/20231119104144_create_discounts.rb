class CreateDiscounts < ActiveRecord::Migration[7.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :description
      t.jsonb :rule_params

      t.timestamps
    end
  end
end
