class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :price
      t.integer :amount
      t.integer :is_active, null:false, default: 1

      t.timestamps
    end
  end
end
