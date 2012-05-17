module WeiboOauthRails
  class Engine < ::Rails::Engine
    isolate_namespace WeiboOauthRails
    
    initializer "weibo_oauth_rails_engine.load_configs" do |app|
      require File.expand_path('../utils', __FILE__)
    end
  end
end
