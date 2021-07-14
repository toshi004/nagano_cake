class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = Customer.find(current_customer.id)
    @address = Address.new
    @addresses = Address.where(customer_id: @customer)
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def edit
    @customer = Customer.find(current_customer.id)
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @customer = Customer.find(current_customer.id)
    address = Address.find(params[:id])
    address.destroy
    redirect_to action: :index
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :name, :address)
  end


end
