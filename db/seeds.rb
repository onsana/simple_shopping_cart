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

Product.create(product_code: "GR1", name: "Green Tea", price: 3.11)
Product.create(product_code: "SR1", name: "Strawberries", price: 5.00)
Product.create(product_code: "CF1", name: "Coffe", price: 11.23)
