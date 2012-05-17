class CreateUserMigration < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :raw_data

      t.timestamps
    end
    
    add_index :users, :email, :unique => true
  end
end
