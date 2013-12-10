class User < ActiveRecord::Base
has_many :profiles
 #has_secure_password

  validates :email,
                    format:     { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }

has_many :authorizations
end
