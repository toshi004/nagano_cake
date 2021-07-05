class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer)
  end

  def edit
    @customer = Customer.find(current_customer)
  end

  def update
    @customer = Customer.find(current_customer)
    @customer.update(customer_params)
    redirect_to customers_my_page_path(@customer.id)
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(current_customer)
    @customer.update_attri(:is_active, false)
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end


end
