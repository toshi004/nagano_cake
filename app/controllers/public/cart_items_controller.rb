class Public::CartItemsController < ApplicationController

    def index
        @cart_items = CartItem.all
        @cart_item[:cart_item][:amount] = session[:cart_item][:amount]
    end

    def update
        @cart_item.update(amount: params[:amount].to_i)
        redirect_to cart_items_path
    end

    def destroy

    end

    def destroy_all
    end

    def create
        @cart_item = CartItem.new(session[:cart_item])
        @cart_item.save(cart_item_params)
        redirect_to cart_items_path
    end

    private

    def cart_item_params
        params.require(:cart_item).permit(:amount)
    end
end
