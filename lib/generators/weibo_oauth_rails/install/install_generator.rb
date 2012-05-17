class WeiboOauthRails::InstallGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  desc "Install weibo_oauth_rails."
  
  def copy_initializer_file
    template "weibo_oauth_rails.rb", "config/initializers/weibo_oauth_rails.rb"
  end
  
  def copy_migration_file
    puts "parameters"
    puts file_name
    puts class_name
    puts plural_name
    template "migration.rb", "db/migrate/create_weibo_oauth_rails_user_migration.rb"
  end

  def create_helper_file
    time = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i.to_s
    create_file "db/migrate/#{time}_create_weibo_oauth_rails_user_migration.rb", <<-FILE
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
    FILE
  end
  
  def create_model_file
    create_file "app/models/#{file_name}.rb", <<-FILE
class ${class_name} < ActiveRecord::Base
  include WeiboOauthRails::User
  attr_accessible :provider, :uid, :name, :email
end
    FILE
  end
end
