class RemoveColumnDeliveryAgain < ActiveRecord::Migration[7.0]
  def up
    drop_table :deliveries
  end
end
