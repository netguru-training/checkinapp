class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.timestamps
    end

    add_reference :checkins, :user, index: true
    add_reference :checkins, :place, index: true
  end
end
