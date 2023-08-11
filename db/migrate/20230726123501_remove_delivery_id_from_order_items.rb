class RemoveDeliveryIdFromOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_details, :delivery_id, :integer
  end
end
