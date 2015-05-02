class ScheduledUpdate < ActiveRecord::Base
  belongs_to :user
  has_one :tweet

  validates :user_id, presence: true
  validates :content, presence: true
  validates :due_at, presence: true
end
