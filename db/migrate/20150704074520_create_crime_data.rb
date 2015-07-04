class CreateCrimeData < ActiveRecord::Migration
  def change
    create_table :crime_data do |t|
      t.string :category
      t.string :local_authority
      t.string :time
      t.string :season
      t.string :light

      t.timestamps null: false
    end
  end
end
