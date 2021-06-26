class OrderItem < ApplicationRecord

  has_many :orders, dependent: :destroy
  belongs_to :item

end
