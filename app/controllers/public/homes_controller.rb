class Public::HomesController < ApplicationController

  def top
    @items = Item.limit(4).order("created_at DESC")
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    end
  end

end
