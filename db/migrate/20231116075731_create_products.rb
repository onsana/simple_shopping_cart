class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_code
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end