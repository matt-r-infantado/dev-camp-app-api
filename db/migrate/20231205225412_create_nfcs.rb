class CreateNfcs < ActiveRecord::Migration[7.1]
  def change
    create_table :nfcs do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.string :tag
      t.timestamps
    end
  end
end
