class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id,   null: false
      t.string :postal_code,    null: false
      t.string :address,        null: false
      t.string :name,           null: false
      t.integer :shipping_fee, default: 800
      t.integer :total_fee,     null: false
      t.integer :payment,       null: false, default: 0
      t.integer :is_active,     null: false, default: 0

      t.timestamps
    end
  end
end
