class AddTitleToApartments < ActiveRecord::Migration[7.0]
  def change
    add_column :apartments, :title, :string
  end
end
