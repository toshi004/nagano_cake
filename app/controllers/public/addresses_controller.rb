class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to action: :index
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to action: :index
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :name, :address)
  end


end
