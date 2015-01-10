class CreateOauthLogins < ActiveRecord::Migration
  def change
    create_table :oauth_logins do |t|
      t.string :type
      t.integer :user_id
      t.string :uid
      t.timestamps
    end
  end
end
