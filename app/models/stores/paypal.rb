#Module Stores
#  class Paypal
#  end
#end
class Stores::Paypal
  include PayPal::SDK::REST
  #attr_reader :payment    ->   paypal.payment
  #attr_writer :payment    ->   paypal.payment = "Hola "
  attr_accessor :payment #tiene los dos anteriores (accessor vs variable de clase)
  attr_accessor :shopping_cart
  attr_accessor :return_url, :cancel_url
  
  def initialize(options)
    self.shopping_cart = options[:shopping_cart]
    self.return_url = options[:return_url]
    self.cancel_url = options[:cancel_url]
  end
  
  def process_payment
    # Build Payment object
    self.payment = Payment.new({
      intent: "sale",
      payer: {
        payment_method: "paypal"
      },
      transactions: [{
        item_list: {
          items: self.shopping_cart.items
        },
        amount: {
          total: (self.shopping_cart.total/100),
          currency: "USD"
        },
        description: "Compra de tus productos en nuestra plataforma."
      }],
      redirect_urls: {
        return_url: self.return_url,
        cancel_url: self.cancel_url
      }
    })
    self.payment
  end
end