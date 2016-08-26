class User < ActiveRecord::Base
  has_secure_password

  has_many :groups, dependent: :destroy
  has_many :members
	has_many :joined_groups, through: :members, source: :group, dependent: :destroy

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :email, format: {:with => email_regex}, uniqueness: {case_sensitive: false}
end
