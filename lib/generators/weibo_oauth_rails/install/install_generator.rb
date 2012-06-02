class WeiboOauthRails::InstallGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  desc "Install weibo_oauth_rails."
  
  def copy_initializer_file
    template "weibo_oauth_rails.rb", "config/initializers/weibo_oauth_rails.rb"
  end
  
  def copy_migration_file
    time = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i.to_s
    create_file "db/migrate/#{time}_create_weibo_oauth_rails_user_migration.rb", <<-FILE
class CreateWeiboOauthRailsUserMigration < ActiveRecord::Migration
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
class #{class_name} < ActiveRecord::Base
  include WeiboOauthRails::Utils::InstanceMethods
  attr_accessible :provider, :uid, :name, :email
  
  private
    def user_from_cookie
      User.authenticate_with_cookie(* remember_token)
    end
end
    FILE
  end
  
  def add_routes
    route("mount WeiboOauthRails::Engine, :at => '/'")
  end
end
