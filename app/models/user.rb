class User < ActiveRecord::Base
	 
	 	before_save {
	 	 if self.email
	 		self.email = email.downcase 
	 	end


}
	 before_create :create_remember_token
has_many :profiles
 #has_secure_password

  validates :email,
                    format:     { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
      [has_secure_password]
has_many :authorizations
def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
