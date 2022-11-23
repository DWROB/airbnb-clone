class ChangeNameOfLocationColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column(:apartments, :location, :address)
  end
end
