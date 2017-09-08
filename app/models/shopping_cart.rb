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
        #Mandar los archivos
      end
      transitions from: [:created], to: :payed
    end
  end
  
  def total
    products.sum(:pricing)
  end
end
