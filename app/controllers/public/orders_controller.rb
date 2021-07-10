class Public::OrdersController < ApplicationController
  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
    @address = Address.all
  end

  def confirm
    @customer = Customer.find(current_customer.id)
    @order = Order.new(@attr)
    @cart_items = CartItem.where(customer_id: @customer)
    @total = 0
      @cart_items.each do |i|
          @total += i.item_subtotal
      end
    @total_fee = @total + @order.shipping_fee
  end

  def decide
    @order = Order.new(@attr)
    @order.customer = current_customer
    @order.save!
    @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        @order_items = OrderItem.new(@attr)
        @order_items.order_id = @order.id
        @order_items.item_id = cart_item.item.id
        @order_items.price = cart_item.item.add_tax_price.to_s(:delimited)
        @order_items.amount = cart_item.amount
        @order_items.save
          current_customer.cart_items.destroy_all
      end
    redirect_to orders_thanks_path
  end

  def thanks
    @customer = Customer.find(current_customer.id)
  end

  def index
    @customer = Customer.find(current_customer.id)
    @orders = Order.all
    @order_items = Order.find(params[:id])
  end

  def show
    @customer = Customer.find(current_customer.id)
    @order = Order.find(params[:id])
    @order_items = OrderItem.find(params[:id])
  end

  private

  def order_params
    @attr = params.require(:order).permit(
      :postal_code, :address, :name, :total_fee, :payment, :is_active,
      order_items_attributes: {order_id: [], item_id: [], price: [], amount: []}
      )
  end

end