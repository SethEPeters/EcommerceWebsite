class OrdersController < ApplicationController
  def index
    if user_signed_in?
      @orders = Order.all.where(email: current_user.email)
    else
      @orders = nil
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def destroy
    @order = Order.find(params[:id])
    customer = @order.customer
    @order.destroy
    customer.destroy
    redirect_to items_path
  end

  def create
    prov_id = params[:order][:province_tax_id]
    # prov = ProvinceTax.find(prov_id).province
    # puts "OUT PUT OUT PUT OUT PUT #{prov}"

    @customer = Customer.create!(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],
    street_address: params[:delivery_address], province: ProvinceTax.find(prov_id).province)

    @order = Order.new(order_params) #This takes the new.html.erb for inputs that have a (f.) before it. Right now only province
    @order.customer = @customer
    @order.first_name = params[:first_name]
    @order.last_name = params[:last_name]
    @order.email = params[:email]
    @order.delivery_address = params[:delivery_address]

    order_gst = @current_cart.sub_total * (ProvinceTax.find(prov_id).gst / 100)
    order_pst = @current_cart.sub_total * (ProvinceTax.find(prov_id).pst / 100)
    order_hst = @current_cart.sub_total * (ProvinceTax.find(prov_id).hst / 100)
    @order.order_total_at_purchase = @current_cart.sub_total + order_gst + order_pst + order_hst
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