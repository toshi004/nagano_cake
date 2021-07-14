class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  def item_subtotal
    amount * item.add_tax_price
  end

end
