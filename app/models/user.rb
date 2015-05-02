class User < ActiveRecord::Base
  has_one :twitter_login

  has_many :scheduled_updates

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET']
      config.access_token        = twitter_login.token
      config.access_token_secret = twitter_login.secret
    end
  end
end
