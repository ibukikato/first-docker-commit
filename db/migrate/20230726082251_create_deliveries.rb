class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.datetime :time

      t.timestamps
    end
  end
end
