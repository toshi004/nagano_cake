class Public::ItemsController < ApplicationController

  def index
    @customer = Customer.find(current_customer.id)
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @customer = Customer.find(current_customer.id)
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
