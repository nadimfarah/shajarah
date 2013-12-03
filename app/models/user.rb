class User < ActiveRecord::Base
has_many :profiles
 #has_secure_password

before_save { self.email = email.downcase }
  validates :email,
                    format:     { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end

has_many :authorizations
end
