# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :string
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ActiveRecord::Base
  include AASM
  has_many :products, through: :in_shopping_carts
  has_many :in_shopping_carts
  #status = 0, status = 1
  #enum status: {payed: 1, default: 0}
  
  aasm column: "status" do
    state :created, initial: true
    state :payed
    state :failed
    
    event :pay do
      after do
        self.generate_links()
        #Mandar los archivos
      end
      transitions from: [:created], to: :payed
    end
  end
  
  def generate_links
    self.products.each do |product|
      Link.create(expiration_date: DateTime.now + 7.days, product: product)
    end
  end
  
  def items
    #self.products map do |product|
    #end
    self.products.map{ |product| product.paypal_form }
    
    #{name: "DEMO",sku: :item, price: (self.shopping_cart.total/100),currency:"USD",quantity:1}
  end
  
  def total
    products.sum(:pricing)
  end
end
