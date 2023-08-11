class AddColumnFragranceOrderDetailsAgain < ActiveRecord::Migration[7.0]
  def change
    change_table :order_details do |t|
      t.references :fragrance, null: false, foreign_key: true
    end
  end
end
