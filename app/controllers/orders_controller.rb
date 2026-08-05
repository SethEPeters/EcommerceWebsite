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
    prov_id = params[:province]
    puts "HEREHEREHEREHEREHEREHERE "
    puts prov_id
    @customer = Customer.create!(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],
    street_address: params[:delivery_address], province: ProvinceTax.select(:name).find(prov_id))

    @order = Order.new(order_params)
    @order.customer = @customer
    @order.order_total_at_purchase = @current_cart.sub_total
    @order.date_of_purchase = Time.current
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