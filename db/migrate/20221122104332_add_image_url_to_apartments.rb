class AddImageUrlToApartments < ActiveRecord::Migration[7.0]
  def change
    add_column :apartments, :imageURL, :string
  end
end
