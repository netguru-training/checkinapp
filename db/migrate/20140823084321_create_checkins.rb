class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :user_id
      t.integer :place_id
      t.data :timestamp

      t.timestamps
    end
  end
end
