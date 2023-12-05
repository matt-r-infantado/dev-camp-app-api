class CreateGatePermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :gate_permissions do |t|
      t.bigint :role_id
      t.bigint :gate_id
      t.timestamps
    end
  end
end
