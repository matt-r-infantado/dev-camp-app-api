# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.bigint :device_id
      t.bigint :role_id
      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end