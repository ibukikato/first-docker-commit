class RemoveColumnFragranceAgain < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :cart_items, :fragrances
    remove_reference :cart_items, :fragrance, index: true
  end
end
