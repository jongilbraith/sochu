class AddPerformedAtToScheduledUpdates < ActiveRecord::Migration
  def change
    add_column :scheduled_updates, :performed_at, :datetime, after: :due_at
  end
end
