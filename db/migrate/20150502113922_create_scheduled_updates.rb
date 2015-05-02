class CreateScheduledUpdates < ActiveRecord::Migration
  def change
    create_table :scheduled_updates do |t|
      t.integer :user_id
      t.string :content
      t.datetime :due_at
      t.timestamps

      t.index :user_id
    end
  end
end
