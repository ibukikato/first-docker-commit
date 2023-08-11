class CreateRamns < ActiveRecord::Migration[7.0]
  def change
    create_table :ramns do |t|
      t.text :content

      t.timestamps
    end
  end
end
