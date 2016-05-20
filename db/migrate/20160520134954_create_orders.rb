class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_price, precision: 7, scale: 2
      t.datetime :completed_date
      t.string :state
      t.references :customer, index: true, foreign_key: true
      t.references :credit_card, index: true, foreign_key: true
      t.integer :billing_address_id
      t.integer :shipping_address_id

      t.timestamps null: false
    end
  end
end
