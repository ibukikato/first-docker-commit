class RemoveDeliveryIdFromCartItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_items, :delivery_id, :integer
  end
end
