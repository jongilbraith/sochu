class Tweet < ActiveRecord::Base
  belongs_to :scheduled_update

  validates :scheduled_update_id, presence: true
  validates :twitter_id, presence: true
  validates :content, presence: true
  validates :url, presence: true
  validates :timestamp, presence: true
end
