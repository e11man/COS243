# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  # Adds a product to the cart
  def add_product(product)
    # Find the line item with the specified product
    current_item = line_items.find_by(product_id: product.id)

    # If the item is already in the cart, increase the quantity
    if current_item
      current_item.quantity += 1
    else
      # Otherwise, create a new line item
      current_item = line_items.build(product_id: product.id)
    end

    # Return the line item (either updated or newly created)
    current_item
  end
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end

