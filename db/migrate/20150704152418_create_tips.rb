class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :tip
      t.references :crime_datum, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
