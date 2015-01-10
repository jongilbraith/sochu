class OauthLogin < ActiveRecord::Base
  belongs_to :user

  def self.create_with_omniauth(auth_hash)
    create! do |login|
      login.uid = auth_hash["uid"]
      login.user = User.create(name: auth_hash['info']['name'])
      login.token = auth_hash['credentials']['token']
      login.secret = auth_hash['credentials']['secret']
      login.expires = auth_hash['credentials']['expires']
      login.expires_at = auth_hash['credentials']['expires_at']
    end
  end
end
