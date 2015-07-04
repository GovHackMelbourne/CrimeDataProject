class CreatePostcodeLgaLookups < ActiveRecord::Migration
  def change
    create_table :postcode_lga_lookups do |t|
      t.string :postcode
      t.string :lga

      t.timestamps null: false
    end
  end
end
