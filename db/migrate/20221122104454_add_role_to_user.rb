class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :host, :boolean, null: false, default: false
  end
end
