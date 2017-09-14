# == Schema Information
#
# Table name: in_shopping_carts
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  shopping_cart_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe InShoppingCart, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it{ should belong_to :product }
  it{ should belong_to :shopping_cart }
  it{ should have_one :user } #El dueño del producto
end
