class Admin::HomesController < ApplicationController

  def top
    path = Rails.application.routes.recognize_path(request.referer)

    if path[:controller] ==  "admins/customers" && path[:action] == "show"
      @orders = Order.where(customer_id: path[:id])
      @orders = Order.page(params[:page])
    else
      @orders = Order.page(params[:page])
    end
  end

end
