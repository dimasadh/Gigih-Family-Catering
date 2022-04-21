class AddFieldsToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :menu_price, :float
  end
end
