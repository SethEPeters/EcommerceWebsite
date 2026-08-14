class CartsController < ApplicationController
  def show
    @cart = @current_cart

    flash[:large_order] = "Thank you so much for your patronage!"

  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end
