class AddDescriptionToApartments < ActiveRecord::Migration[7.0]
  def change
    add_column :apartments, :description, :string
  end
end
