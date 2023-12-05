class CreateGates < ActiveRecord::Migration[7.1]
  def change
    create_table :gates do |t|
      t.string :serial_number

      t.timestamps
    end
  end
end
