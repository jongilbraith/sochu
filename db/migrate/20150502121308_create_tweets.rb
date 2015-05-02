class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :scheduled_update_id
      t.string :twitter_id
      t.string :content
      t.string :url
      t.datetime :timestamp
      t.timestamps

      t.index :scheduled_update_id
    end
  end
end
