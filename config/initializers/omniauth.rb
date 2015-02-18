Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Settings.twitter.api_key, Settings.twitter.api_secret
end
