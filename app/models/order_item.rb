class OrderItem < ApplicationRecord

  belongs_to :order, dependent: :destroy
  belongs_to :item

  enum is_active: {着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}

  def add_tax_price
    (self.price * 1.08).round
  end

  def item_subtotal
    amount * item.add_tax_price
  end

end
