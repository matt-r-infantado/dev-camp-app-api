class CreateUserDevices < ActiveRecord::Migration[7.1]
  def change
    create_table :user_devices do |t|
      t.bigint :user_id
      t.string :serial_number


      t.timestamps
    end
  end
end
