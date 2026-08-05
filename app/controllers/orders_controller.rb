class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to @order
    else
      Rails.logger.debug @order.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private
    def order_params
      params.require(:order).permit(:name, :email, :province_tax_id, :delivery_address, :pay_method)
    end
end