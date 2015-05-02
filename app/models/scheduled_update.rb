class ScheduledUpdate < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true
  validates :due_at, presence: true
end
