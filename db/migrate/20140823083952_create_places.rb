class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :street
      t.string :city
      t.string :country

      has_many: 
      t.timestamps
    end
  end
end
