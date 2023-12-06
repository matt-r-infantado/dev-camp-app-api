class CreateAccessLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :access_logs do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :gate, foreign_key: { to_table: :gates }
      t.references :nfc, foreign_key: { to_table: :nfcs }
      t.boolean :is_access
      t.timestamps
    end
  end
end
