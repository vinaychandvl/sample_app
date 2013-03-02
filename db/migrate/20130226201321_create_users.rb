class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :userName, :null => false
      t.string :emailID, :null => false
      t.string :firstName
      t.string :lastName
      t.string :password, :null => false
      t.string :roles
      t.timestamps, :null => false
    end
  end

  def self.down
    drop_table :users
  end

end
