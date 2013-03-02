class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :userName
      t.string :firstName
      t.string :lastName
      t.string :emailID
      t.string :password
      t.string :password_confirmation
      t.string :password_digest
      t.string :roles

      t.timestamps
    end
    add_index :users, :userName
    add_index :users, :emailID
  end

  def self.down
  	drop_index :users, :userName
  	drop_index :users, :emailID
  	drop_table :users
  end
end
