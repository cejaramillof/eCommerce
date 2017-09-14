# == Schema Information
#
# Table name: my_payments
#
#  id               :integer          not null, primary key
#  email            :string
#  ip               :string
#  status           :string
#  fee              :decimal(6, 2)
#  paypal_id        :string
#  total            :decimal(8, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  shopping_cart_id :integer
#

class MyPayment < ActiveRecord::Base
  include AASM
  belongs_to :shopping_cart
  has_many :products, through: :shopping_cart
  
  aasm column: "status" do
    state :created, initial: true
    state :payed
    state :failed
    
    event :pay do
      after do
        shopping_cart.pay!
      end
      transitions from: [:created], to: :payed
    end
  end
  
  def products_by_user(user)
    self.products.where(products:{user_id:user.id})
  end
end
