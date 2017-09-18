class WelcomeController < ApplicationController
  def index
    @orders = current_user.orders.order("created_at desc").index_by {|r| r[:shopping_cart_id]}.values
  end
  def unregistered
    render layout: "landing"
  end
  def payment_succed
    if @shopping_cart.payed?
      cookies[:shopping_cart_id] = nil
    else
      redirect_to carrito_path
    end
  end
end
