class AddColumnDeliveryCartItemsAgain < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :delivery, :datetime, null:false
  end
end
