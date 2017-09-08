class CreateMyPayments < ActiveRecord::Migration
  def change
    create_table :my_payments do |t|
      t.string :email
      t.string :ip
      t.string :status
      t.decimal :fee, precision: 7, scale: 3
      t.string :paypal_id
      t.decimal :total, precision: 9, scale: 3

      t.timestamps null: false
    end
  end
end
