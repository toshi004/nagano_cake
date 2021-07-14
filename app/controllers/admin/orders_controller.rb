class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
    @total = 0
      @order_items.each do |i|
          @total += i.item_subtotal
      end
    @total_fee = @total + @order.shipping_fee
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:is_active)
  end

end
