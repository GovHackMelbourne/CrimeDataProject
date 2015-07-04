class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :tip
      t.integer :crime_datum_id

      t.timestamps null: false
    end
  end
end
