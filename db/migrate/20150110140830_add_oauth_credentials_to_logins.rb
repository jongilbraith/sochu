class AddOauthCredentialsToLogins < ActiveRecord::Migration
  def change
    add_column :oauth_logins, :expires_at, :timestamp, after: :uid
    add_column :oauth_logins, :expires, :boolean, after: :uid
    add_column :oauth_logins, :secret, :string, after: :uid
    add_column :oauth_logins, :token, :string, after: :uid
  end
end
