Rails.application.config.middleware.use OmniAuth::Builder do
  provider :weibo, ENV['WEIBO_API_KEY'] || '', ENV['WEIBO_API_SECRET'] || ''
end