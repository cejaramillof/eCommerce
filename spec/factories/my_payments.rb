# == Schema Information
#
# Table name: my_payments
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  status     :string
#  fee        :decimal(7, 3)
#  paypal_id  :string
#  total      :decimal(9, 3)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :my_payment do
    email "MyString"
    ip "MyString"
    status "MyString"
    fee "9.99"
    paypal_id "MyString"
    total "9.99"
  end
end
