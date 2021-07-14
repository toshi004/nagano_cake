class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    end
    @items = Item.page(params[:page]).per(8)
  end

  def show
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    end
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
