class CreatePoliceMapData < ActiveRecord::Migration
  def change
    create_table :police_map_data do |t|
      t.string :category
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :phone

      t.timestamps null: false
    end
  end
end
