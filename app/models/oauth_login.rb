class OauthLogin < ActiveRecord::Base
  belongs_to :user

  def self.create_with_omniauth(auth_hash)
    create! do |login|
      login.uid = auth_hash["uid"]
      login.user = User.create(name: auth_hash['info']['name'])
    end
  end
end
