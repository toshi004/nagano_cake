class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping_fee, default: 800
      t.integer :total_fee
      t.integer :payment, null: false, default: 1
      t.integer :is_active, null: false, default: 1

      t.timestamps
    end
  end
end
