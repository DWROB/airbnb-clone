class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :location
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
