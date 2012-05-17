$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "weibo_oauth_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "weibo_oauth_rails"
  s.version     = WeiboOauthRails::VERSION
  s.authors     = ["simsicon"]
  s.email       = ["simsicon@gmail.com"]
  s.homepage    = "http://zenzlog.com"
  s.summary     = "Weibo Oauth Rails Plugin"
  s.description = "A Light Weibo Oauth Rails Plugin"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
