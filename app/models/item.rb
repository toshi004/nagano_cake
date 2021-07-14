class Item < ApplicationRecord

  belongs_to :genre, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  attachment :image

  def add_tax_price
    (self.price * 1.08).round
  end

end
