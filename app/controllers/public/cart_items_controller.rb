class Public::CartItemsController < ApplicationController

    def index
        @customer = Customer.find(current_customer.id)
        @cart_items = CartItem.where(customer_id: @customer)
        @total = 0
        @cart_items.each do |i|
            @total += i.item_subtotal
        end
    end

    def update
        cart_item = CartItem.find(params[:id])
        cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end

    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
    end

    def destroy_all
        customer = Customer.find(current_customer.id)
        cart_item = CartItem.where(customer_id: customer)
        cart_item.destroy_all
        redirect_to cart_items_path
    end

    def create
        @cart_item = CartItem.new(cart_item_params)
        @item = Item.find(params[:item_id])
        @cart_item.item_id = @item.id
        @cart_item.customer_id = current_customer.id
        if current_customer.cart_items.find_by(item_id: params[:item_id]).present?
            cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
            cart_item.amount += params[:cart_item][:amount].to_i
            cart_item.save
            redirect_to cart_items_path
        else
            @cart_item.save
            redirect_to cart_items_path
        end
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:amount, :item_id, :customer_id)
    end
end
