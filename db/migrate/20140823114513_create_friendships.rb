class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :status, default: 0
      t.timestamps
    end

    add_reference :friendships, :sender, index: true
    add_reference :friendships, :receiver, index: true
  end
end
