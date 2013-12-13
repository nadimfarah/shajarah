class Profile < ActiveRecord::Base
  belongs_to :User
  validates :firstname, presence: true
   validates :relation, presence: true
end
