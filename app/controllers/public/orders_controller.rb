class Public::OrdersController < ApplicationController

  def new
  end

  def confirm
    @orders = Order.find(params[:id])
  end

  def thanks
  end

  def decide
  end

  def index
    @orders = Order.all
    @order_items = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
  end

end
