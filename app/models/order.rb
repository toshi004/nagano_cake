class Order < ApplicationRecord

  belongs_to :customer
  belongs_to :order_items

  enum payment: { クレジットカード: 1, 銀行振込: 2 }
  enum is_active: { 入金待ち: 1, 入金確認: 2, 製作中: 3, 発送準備中: 4, 発送済み: 5 }

end
