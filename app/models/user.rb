class User < ActiveRecord::Base
has_many :profiles
 #has_secure_password
def add_provider(auth_hash)
  # Check if the provider already exists, so we don't add it twice
  unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    Authorization.create :user_id => self.id, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  end
end
before_save { self.email = email.downcase }
  validates :email,
                    format:     { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end

has_many :authorizations
end
