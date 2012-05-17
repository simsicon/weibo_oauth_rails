Rails.application.routes.draw do

  mount WeiboOauthRails::Engine => "/weibo_oauth_rails"
end
