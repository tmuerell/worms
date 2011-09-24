class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.database_authenticatable :null => false
      t.trackable
      
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.string :worm_team_name
      
      t.timestamps
    end

    add_index :users, :email,                :unique => true
  end
end
