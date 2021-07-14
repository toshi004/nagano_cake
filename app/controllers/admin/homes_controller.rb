class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, except: [:top]

  def top
    path = Rails.application.routes.recognize_path(request.referer)

    if path[:controller] == "admin/customers"
      @orders = Order.where(customer_id: path[:id]).page(params[:page])
    else
      @orders = Order.page(params[:page])
    end
  end

end
