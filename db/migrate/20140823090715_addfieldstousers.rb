class Addfieldstousers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, null: false
    add_column :users, :last_name, null: false
  end
end
