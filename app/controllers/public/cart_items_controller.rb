class Public::CartItemsController < ApplicationController
    def index
        @cart_items = CartItem.find(current_customer)
    end

    def update
    end

    def destroy

    end

    def destroy_all
    end

    def create
    end
end
