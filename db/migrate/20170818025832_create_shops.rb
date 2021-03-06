class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :logo
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
