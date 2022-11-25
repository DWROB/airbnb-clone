class AddPriceToApartments < ActiveRecord::Migration[7.0]
  def change
    add_column :apartments, :price, :float, default: 50.00
  end
end
