class Authorization < ActiveRecord::Base
def self.find_or_create(auth_hash)
  unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    user = User.find(:id =>1)
    auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  end
 
  auth

end
belongs_to :user
validates :provider, :uid, :presence => true
end
