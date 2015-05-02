class User < ActiveRecord::Base
  has_one :twitter_login

  has_many :scheduled_updates
end
