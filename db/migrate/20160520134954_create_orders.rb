class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_price, precision: 7, scale: 2
      t.datetime :completed_date
      t.string :state, default: 'in progress'
      t.references :customer, index: true, foreign_key: true
      t.references :credit_card, index: true, foreign_key: true
      t.integer :billing_address_id
      t.integer :shipping_address_id

      t.timestamps null: false
    end
    add_foreign_key :orders, :addresses, { column: :billing_address_id }
    add_foreign_key :orders, :addresses, { column: :shipping_address_id }
  end
end
