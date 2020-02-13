class User < ActiveRecord::Base
  has_secure_password
  has_many :goals
  validates :username, presence: true, uniqueness: true, length: { in: 2..20}
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 6..15 }
end
