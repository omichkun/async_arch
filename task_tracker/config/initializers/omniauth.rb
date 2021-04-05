require 'popugi'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :popugi, ENV['AUTH_APP_ID'], ENV['AUTH_SECRET'], provider_ignores_state: true
end