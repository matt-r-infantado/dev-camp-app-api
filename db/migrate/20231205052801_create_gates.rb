class CreateGates < ActiveRecord::Migration[7.1]
  def change
    create_table :gates do |t|
      t.string :serial_number
      t.string :name
      t.timestamps
    end
  end
end
