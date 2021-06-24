class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.find(params[:id])
    render "admin/order_items/update"
  end

  def update
  end

end
