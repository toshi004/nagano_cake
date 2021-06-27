class OrderItem < ApplicationRecord

  has_many :orders, dependent: :destroy
  belongs_to :item

  enum is_active: { 着手不可: 1, 製作待ち: 2, 製作中: 3, 製作完了: 4 }

end
