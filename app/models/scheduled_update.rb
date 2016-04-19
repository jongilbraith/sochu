class ScheduledUpdate < ActiveRecord::Base
  belongs_to :user
  has_one :tweet

  validates :user_id, presence: true
  validates :content, presence: true
  validates :due_at, presence: true

  scope :untweeted, ->{
    joins('LEFT JOIN tweets on scheduled_updates.id = tweets.scheduled_update_id').
    where('tweets.id IS NULL')
  }

  def tweet!
    posted_tweet = user.twitter_client.update(content)

    Tweet.create! do |tweet|
      tweet.scheduled_update = self

      tweet.twitter_id = posted_tweet.id
      tweet.content = posted_tweet.text
      tweet.url = posted_tweet.uri.to_s
      tweet.timestamp = posted_tweet.created_at
    end

    update_attribute(:performed_at, Time.now)
  end
end
