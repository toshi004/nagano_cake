class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    session.delete(:order)
    @customer = Customer.find(current_customer.id)
    @order = Order.new
    @addresses = Address.where(customer_id: @customer)
  end

  def confirm
    @customer = Customer.find(current_customer.id)
    @order = Order.new(order_params)
    session[:order] = @order
    @cart_items = CartItem.where(customer_id: @customer)
    @total = 0
      @cart_items.each do |i|
          @total += i.item_subtotal
      end
    @total_fee = @total + @order.shipping_fee
    if params[:order][:address_option] == "0"
      @order.postal_code = @customer.postal_code
      @order.name = @customer.full_name
      @order.address = @customer.address
    elsif params[:order][:address_option] == "1"
      @fir = params[:order][:address].to_i
      @address = Address.find(@fir)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:new_address]
      @order.name = params[:order][:name]
    end
  end

  def decide
    @order = Order.new(order_params)
    @order.customer = current_customer
    @order.save(session[:order])
    session.delete(:order)
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
    @orders = Order.where(customer_id: @customer)
  end

  def show
    @customer = Customer.find(current_customer.id)
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order)
    @total = 0
      @order_items.each do |i|
          @total += i.item_subtotal
      end
    @total_fee = @total + @order.shipping_fee
  end

  private

  def order_params
    params.require(:order).permit(
      :postal_code, :address, :name, :total_fee, :payment, :is_active,
      order_items_attributes: {order_id: [], item_id: [], price: [], amount: []}
      )
  end

end