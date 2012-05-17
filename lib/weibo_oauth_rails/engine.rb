module WeiboOauthRails
  class Engine < ::Rails::Engine
    isolate_namespace WeiboOauthRails
    
    initializer do |app|
      require File.expand_path('../utils', __FILE__)
    end
  end
end
