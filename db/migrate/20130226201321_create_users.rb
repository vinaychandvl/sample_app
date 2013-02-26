class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userName
      t.string :emailID
      t.string :firstName
      t.string :lastName
      t.string :password
      t.string :roles

      t.timestamps
    end
  end
end
