Rails.application.config.middleware.use OmniAuth::Builder do
  provider :oauth2, ENV['AUTH_APP_ID'], ENV['AUTH_SECRET']
end