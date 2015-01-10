class User < ActiveRecord::Base
  has_one :twitter_login
end
