# frozen_string_literal: true

class AddUsersMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :message, :text
  end
end
