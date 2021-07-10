class Public::OrdersController < ApplicationController
  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
    @address = Address.all
  end

  def confirm
    @customer = Customer.find(current_customer.id)
    @orders = Order.find(params[:id])
    @cart_items = CartItem.where(customer_id: @customer)
  end

  def thanks
    @customer = Customer.find(current_customer.id)
  end

  def decide
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

end