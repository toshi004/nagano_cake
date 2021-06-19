class OrderItem < ApplicationRecord

  has_many :orders
  belongs_to :item

end
