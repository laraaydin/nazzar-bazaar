class ShippingInfosController < ApplicationController
  def new
    @shipping_info = ShippingInfo.new
  end

  def create
    @shipping_info = ShippingInfo.new(shipping_info_params)
    if @shipping_info.confirm
      redirect_to shipping_method_path
    else
      render :new
    end
  end

  private

  def shipping_info_params
    {
      order: @order,
      customer_name: params[:shipping_info][:customer_name],
      customer_phone_number: params[:shipping_info][:customer_phone_number],
      place_id: params[:shipping_info][:place_id],
      address_2: params[:address_2],
    }
  end
end
