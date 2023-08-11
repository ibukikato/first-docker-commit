class RemoveColumnDelivery < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_items, :delivery, :datetime
  end
end
