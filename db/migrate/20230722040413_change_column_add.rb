class ChangeColumnAdd < ActiveRecord::Migration[7.0]
  def change
    change_table :cart_items do |t|
      t.references :fragrance, null: false, foreign_key: true
    end
  end
end
