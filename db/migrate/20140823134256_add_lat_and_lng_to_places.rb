class AddLatAndLngToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :longitude, :float, null: false
    add_column :places, :latitude, :float, null: false
  end
end
