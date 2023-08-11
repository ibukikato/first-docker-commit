class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :fragrance

  def line_total
    product.price * quantity
  end
end
