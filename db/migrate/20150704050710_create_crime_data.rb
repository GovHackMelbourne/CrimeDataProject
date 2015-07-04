class CreateCrimeData < ActiveRecord::Migration
  def change
    create_table :crime_data do |t|

      t.timestamps null: false
    end
  end
end
