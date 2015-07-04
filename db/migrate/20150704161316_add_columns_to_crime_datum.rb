class AddColumnsToCrimeDatum < ActiveRecord::Migration
  def change
    add_column :crime_data, :tip1, :string
    add_column :crime_data, :tip2, :string
    add_column :crime_data, :tip3, :string
    add_column :crime_data, :tip4, :string
  end
end
