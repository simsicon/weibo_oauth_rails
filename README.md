#WeiboOauthRails

This project uses MIT-LICENSE.

Getting started:
-------------------

1, You can add it to your Gemfile with:
```ruby
gem 'omniauth'
gem 'omniauth-weibo', :git => 'git://github.com/ballantyne/omniauth-weibo.git'
gem 'weibo_oauth_rails', :git => 'git://github.com/simsicon/weibo_oauth_rails.git'
```

2, Then run the bundle and generator:

```console
bundle install
rails generate weibo_oauth_rails:install MODEL_NAME
rake db:migrate
```