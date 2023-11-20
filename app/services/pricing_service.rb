class PricingService
  def self.call(quantity:, product:)
    new(quantity, product).call
  end

  def initialize(quantity, product)
    @quantity = quantity
    @price = product.price.to_f
    @discount = product.discount
  end

  def call
    case discount.name
    when 'two_per_one'
      apply_green_tea_offer
    when 'drop_unit_price'
      apply_bulk_discount_strawberry
    when 'drop_total_price'
      apply_bulk_discount_coffee
    else
      price * quantity
    end
  end

  private

  attr_reader :quantity, :price, :discount

  # Apply Buy One, Get One Free offer for green tea.
  def apply_green_tea_offer
    (quantity / 2 + quantity % 2) * price
  end


  # Apply bulk discount for strawberries.
  def  apply_bulk_discount_strawberry
    if quantity >= discount.rule_params["minimum_quantity"]
      quantity * discount.rule_params["discount_price"]
    else
      quantity * price
    end
  end


  # Apply bulk discount for coffee.
  def apply_bulk_discount_coffee
    if quantity >= discount.rule_params["minimum_quantity"]
      quantity * (price * discount.rule_params["price_ratio"])
    else
      quantity * price
    end
  end
end