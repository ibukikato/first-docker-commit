class AddFragranceIdCartItems < ActiveRecord::Migration[7.0]
  def change
    change_table :cart_items do |t|
      t.references :fragrance, foreign_key: true
    end
  end
end
