class RemoveCoordinatesFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :coordinates
  end
end
