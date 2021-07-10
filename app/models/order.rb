class Order < ApplicationRecord

  belongs_to :customer
  belongs_to :order_item, optional: true
    accepts_nested_attributes_for :order_item
  has_one :item, through: :order_item

  enum payment: { クレジットカード: 0, 銀行振込: 1 }
  enum is_active: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

end
