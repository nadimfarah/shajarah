class User < ActiveRecord::Base
	 if self.email
	 	before_save { self.email = email.downcase }
	 end
has_many :profiles
 #has_secure_password

  validates :email,
                    format:     { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
[has_secure_password]
has_many :authorizations
end
