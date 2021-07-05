class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  def total_price
    self.price * amount
  end

end
