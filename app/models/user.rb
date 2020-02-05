class User < ActiveRecord::Base
  has_secure_password
  has_many :goals
  validates_presence_of :username, :email, :password
end
