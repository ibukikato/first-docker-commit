class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :order_details, :fragrances
    remove_reference :order_details, :fragrance, index: true
  end
end