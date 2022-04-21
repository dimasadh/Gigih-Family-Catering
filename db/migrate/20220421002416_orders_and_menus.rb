class OrdersAndMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :total_price
      t.string :status
      t.belongs_to :customer, foreign_key: true, index: true
      
      t.timestamps
    end

    create_table :menus do |t|
      t.string :name
      t.float :price
      t.text :description
      t.belongs_to :category, foreign_key: true, index: true

      t.timestamps
    end

    create_table :order_details do |t|
      t.belongs_to :order, index: true
      t.belongs_to :menu, index: true
      t.integer :quantity
      t.float :sum_price
    end
  end
end
