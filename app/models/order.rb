class Order < ApplicationRecord

  belongs_to :customer
  belongs_to :order_items

end
