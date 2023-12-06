class AddDisabledColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :disabled, :boolean, default: false
  end
end
