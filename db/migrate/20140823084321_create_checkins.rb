class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :user_id
      t.integer :place_id
      t.timestamp :timestamp

      belongs_to :user
      belongs_to :place

      t.timestamps
    end
  end
end
