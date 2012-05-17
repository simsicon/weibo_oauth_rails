class CreateWeiboOauthRailsUsers < ActiveRecord::Migration
  def change
    create_table :weibo_oauth_rails_users do |t|

      t.timestamps
    end
  end
end
