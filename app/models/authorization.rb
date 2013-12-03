class Authorization < ActiveRecord::Base
def self.find_or_create(auth_hash)

  auth = Authorization.create (:user_id => 1, :provider => auth_hash["provider"], :uid => auth_hash["uid"])

end
belongs_to :user
validates :provider, :uid, :presence => true
end
