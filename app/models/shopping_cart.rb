# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :integer          default(0)
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ActiveRecord::Base
  has_many :products, through: :in_shopping_carts
  has_many :in_shopping_carts
  #status = 0, status = 1
  enum status: {payed: 1, default: 0}
end
