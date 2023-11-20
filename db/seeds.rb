# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# **Products Registered**
# | Product Code | Name | Price |
# |--|--|--|
# | GR1 |  Green Tea | 3.11€ |
# | SR1 |  Strawberries | 5.00 € |
# | CF1 |  Coffee | 11.23 € |

Product.destroy_all
discount_1 = Discount.new(name: 'two_per_one',
                        description: 'The CEO is a big fan of buy-one-get-one-free offers and green tea.',
                        rule_params: { "buy": 1, "get": 1 })
Product.create(product_code: "GR1", name: "Green Tea", price: 3.11, discount: discount_1)
discount_2 = Discount.new(name: 'drop_unit_price',
                        description: 'The COO, though, likes low prices and wants people buying strawberries to get a price  discount for bulk purchases. If you buy 3 or more strawberries, the price should drop to 4.50€.',
                        rule_params: { minimum_quantity: 3, discount_price: 4.5 })
Product.create(product_code: "SR1", name: "Strawberries", price: 5.00, discount: discount_2)
discount_3 = Discount.new(name: 'drop_total_price',
                        description: 'If you buy 3 or more coffees, the price of all coffees should drop to 2/3 of the original price.',
                        rule_params: { minimum_quantity: 3, price_ratio: 2/3.0 })
Product.create(product_code: "CF1", name: "Coffe", price: 11.23, discount: discount_3)
