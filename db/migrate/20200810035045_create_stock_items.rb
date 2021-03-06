class CreateStockItems < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_items do |t|
      
      t.references :product, index: true
      t.references :store, index: true

      t.integer :quantity, null: false, default: 0

      t.timestamps
    end

    add_index :stock_items, [:product_id, :store_id], unique: true
  end
end
