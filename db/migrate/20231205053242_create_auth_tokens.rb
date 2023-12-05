class CreateAuthTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :auth_tokens do |t|
      t.string :token
      t.references :user, foreign_key: { to_table: :users }
      t.datetime :valid_at
      t.timestamps
    end
  end
end
